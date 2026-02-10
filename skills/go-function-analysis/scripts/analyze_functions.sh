#!/bin/bash
# Go Function Analysis Script
# Analyzes Go function lengths in a workspace and generates statistics
# Usage: ./analyze_functions.sh [workspace_path]

set -e

WORKSPACE="${1:-.}"

# Output file
OUTPUT_FILE="$WORKSPACE/README.function.md"
TEMP_FILE=$(mktemp)

# Find all Go files (excluding vendor, .git, and test files based on user preference)
find_go_files() {
    find "$WORKSPACE" -name "*.go" -type f \
        ! -path "*/vendor/*" \
        ! -path "*/.git/*" \
        ! -path "*/_*" \
        2>/dev/null | sort
}

# Extract functions from a Go file and calculate their lengths
# Uses awk to track brace depth and identify function boundaries
# Extract functions from a Go file and calculate their lengths and calls
analyze_file() {
    local file="$1"
    awk '
    BEGIN {
        in_func = 0; depth = 0; func_name = ""; start_line = 0; calls = ""
        # Common Go keywords and built-ins to ignore in calls
        ignore = "^(if|for|switch|case|default|go|defer|func|chan|range|return|select|struct|type|map|append|make|new|panic|recover|print|println|len|cap|close|copy|delete|real|imag|printf|sprintf|errorf)$"
    }

    /^func[[:space:]]/ && in_func == 0 {
        in_func = 1
        start_line = NR
        calls = ""
        line = $0

        # Portable function name extraction
        orig_line = line
        if (line ~ /func[[:space:]]+\([^)]+\)[[:space:]]+[a-zA-Z_][a-zA-Z0-9_]*/) {
            sub(/^func[[:space:]]+\([^)]+\)[[:space:]]+/, "", line)
        } else {
            sub(/^func[[:space:]]+/, "", line)
        }
        match(line, /^[a-zA-Z_][a-zA-Z0-9_]*/)
        func_name = substr(line, RSTART, RLENGTH)
        if (func_name == "") func_name = "anonymous"

        # The rest of the line after the function declaration (params and opening brace)
        # Should be used for call extraction, but skip the function name itself.
        rest_of_line = substr(line, RSTART + RLENGTH)

        line = orig_line
        gsub(/\/\/.*$/, "", line)
        gsub(/\"[^\"]*\"/, "", line)

        # We start counting depth and extracting calls from the REST of the line
        # to avoid matching the function name itself as a call.
        temp_line = rest_of_line
        gsub(/\/\/.*$/, "", temp_line)
        gsub(/\"[^\"]*\"/, "", temp_line)

        while (match(temp_line, /[a-zA-Z_][a-zA-Z0-9_]*\(/)) {
            call = substr(temp_line, RSTART, RLENGTH - 1)
            if (call !~ ignore && call != func_name) {
                calls = (calls == "" ? call : calls "," call)
            }
            temp_line = substr(temp_line, RSTART + RLENGTH)
        }

        open = gsub(/{/, "{", line)
        close_count = gsub(/}/, "}", line)
        depth = open - close_count

        if (depth <= 0) {
            print 1 "\t" func_name "\t" FILENAME "\t" calls
            in_func = 0; depth = 0; func_name = ""
        }
        next
    }

    in_func == 1 {
        line = $0
        # Basic call extraction: identifier followed by (
        # Strip comments and strings first
        gsub(/\/\/.*$/, "", line)
        gsub(/\"[^\"]*\"/, "", line)

        temp_line = line
        while (match(temp_line, /[a-zA-Z_][a-zA-Z0-9_]*\(/)) {
            # Extract the word before (
            call = substr(temp_line, RSTART, RLENGTH - 1)
            if (call !~ ignore) {
                calls = (calls == "" ? call : calls "," call)
            }
            temp_line = substr(temp_line, RSTART + RLENGTH)
        }

        open = gsub(/{/, "{", line)
        close_count = gsub(/}/, "}", line)
        depth += open - close_count

        if (depth <= 0) {
            end_line = NR
            lines = end_line - start_line + 1
            print lines "\t" func_name "\t" FILENAME "\t" calls
            in_func = 0
            depth = 0
            func_name = ""
        }
    }
    ' "$file"
}

# Main analysis
echo "Analyzing Go functions in: $WORKSPACE"
echo ""

# Collect all function data
> "$TEMP_FILE"

while IFS= read -r file; do
    # Make path relative to workspace
    rel_path="${file#$WORKSPACE/}"
    analyze_file "$file" | while IFS=$'\t' read -r lines func_name filepath calls; do
        echo -e "${lines}\t${func_name}\t${rel_path}\t${calls}" >> "$TEMP_FILE"
    done
done < <(find_go_files)

TOTAL=$(wc -l < "$TEMP_FILE" | tr -d ' ')

if [ "$TOTAL" -eq 0 ]; then
    echo "No Go functions found in workspace."
    rm -f "$TEMP_FILE"
    exit 0
fi

echo "Found $TOTAL functions. Calculating call depths..."

# Calculate depths using a helper script (python or bash)
# We'll use a temporary awk script to build the graph and calculate depth
DEPTH_FILE=$(mktemp)

awk -F'\t' '
function get_depth(node_id,   i, max_d, sub_d, callers_arr, n, caller_name) {
    if (node_id in depth_memo) return depth_memo[node_id]
    if (processing[node_id]) return 1 # Cycle detected

    processing[node_id] = 1
    max_d = 0
    n = split(callers[node_id], callers_arr, ",")
    for (i = 1; i <= n; i++) {
        caller_name = callers_arr[i]
        if (caller_name in name_to_id) {
            sub_d = get_depth(name_to_id[caller_name])
            if (sub_d > max_d) max_d = sub_d
        }
    }
    processing[node_id] = 0
    depth_memo[node_id] = 1 + max_d
    return depth_memo[node_id]
}

{
    # $1=lines, $2=name, $3=file, $4=calls
    lines[NR] = $1
    name[NR] = $2
    file[NR] = $3

    # Map name to ID (first occurrence)
    if (!($2 in name_to_id)) name_to_id[$2] = NR

    # Build reverse graph: callers[child] = caller1,caller2...
    num_calls = split($4, calls_arr, ",")
    for (j = 1; j <= num_calls; j++) {
        child = calls_arr[j]
        if (child != "") {
            callers_name_to_ids[child] = (callers_name_to_ids[child] == "" ? $2 : callers_name_to_ids[child] "," $2)
        }
    }
}

END {
    # Distribute callers to specific node IDs
    for (i = 1; i <= NR; i++) {
        callers[i] = callers_name_to_ids[name[i]]
    }

    for (i = 1; i <= NR; i++) {
        print get_depth(i) "\t" lines[i] "\t" name[i] "\t" file[i]
    }
}
' "$TEMP_FILE" > "$DEPTH_FILE"

# Replace TEMP_FILE with DEPTH_FILE (now has: depth \t lines \t name \t file)
mv "$DEPTH_FILE" "$TEMP_FILE"

# Sort by line count for percentile calculation (using field 2)
sort -t$'\t' -k2 -n "$TEMP_FILE" > "${TEMP_FILE}.sorted"

# Calculate percentiles
calc_percentile() {
    local percentile=$1
    local count=$2
    local pos=$(echo "scale=0; ($count * $percentile + 0.5) / 1" | bc)
    [ "$pos" -lt 1 ] && pos=1
    [ "$pos" -gt "$count" ] && pos=$count
    sed -n "${pos}p" "${TEMP_FILE}.sorted"
}

P50=$(calc_percentile 0.50 "$TOTAL")
P90=$(calc_percentile 0.90 "$TOTAL")
P99=$(calc_percentile 0.99 "$TOTAL")

# Calculate average
TOTAL_LINES=$(awk -F'\t' '{sum += $2} END {print sum}' "$TEMP_FILE")
AVG=$(echo "scale=1; $TOTAL_LINES / $TOTAL" | bc)

# Generate README.function.md
cat > "$OUTPUT_FILE" << EOF
# Go Function Analysis

Generated: $(date +%Y-%m-%d)

## Summary Statistics

| File Path | Function Name | Function Lines | Depth Level | Percentile |
|-----------|---------------|----------------|-------------|------------|
EOF

# Add percentile rows (depth lines name file)
echo "$P50" | awk -F'\t' '{printf "| `%s` | `%s` | %s | %s | p50 |\n", $4, $3, $2, $1}' >> "$OUTPUT_FILE"
echo "$P90" | awk -F'\t' '{printf "| `%s` | `%s` | %s | %s | p90 |\n", $4, $3, $2, $1}' >> "$OUTPUT_FILE"
echo "$P99" | awk -F'\t' '{printf "| `%s` | `%s` | %s | %s | p99 |\n", $4, $3, $2, $1}' >> "$OUTPUT_FILE"

cat >> "$OUTPUT_FILE" << EOF

**Total functions:** $TOTAL
**Average length:** $AVG lines

## All Functions (sorted by length, descending)

| File Path | Function Name | Function Lines | Depth Level |
|-----------|---------------|----------------|-------------|
EOF

# Add all functions sorted descending by lines (field 2)
sort -t$'\t' -k2 -rn "$TEMP_FILE" | awk -F'\t' '{printf "| `%s` | `%s` | %s | %s |\n", $4, $3, $2, $1}' >> "$OUTPUT_FILE"

# Cleanup
rm -f "$TEMP_FILE" "${TEMP_FILE}.sorted"

echo ""
echo "Generated: $OUTPUT_FILE"
