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
analyze_file() {
    local file="$1"
    awk '
    BEGIN { in_func = 0; depth = 0; func_name = ""; start_line = 0 }

    # Match function declaration
    /^func[[:space:]]/ {
        if (in_func == 0) {
            in_func = 1
            start_line = NR

            # Extract function name
            line = $0
            if (match(line, /func[[:space:]]+\([^)]+\)[[:space:]]+([a-zA-Z_][a-zA-Z0-9_]*)/, arr)) {
                # Method with receiver
                func_name = arr[1]
            } else if (match(line, /func[[:space:]]+([a-zA-Z_][a-zA-Z0-9_]*)/, arr)) {
                # Regular function
                func_name = arr[1]
            } else {
                func_name = "anonymous"
            }

            # Count opening braces on this line
            gsub(/[^{]/, "", line)
            depth = length(line)
        }
        next
    }

    # Track braces when inside a function
    in_func == 1 {
        line = $0
        open = gsub(/{/, "{", line)
        close_count = gsub(/}/, "}", $0)
        depth += open - close_count

        # Function ends when depth returns to 0
        if (depth <= 0) {
            end_line = NR
            lines = end_line - start_line + 1
            print lines "\t" func_name "\t" FILENAME
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
    analyze_file "$file" | while IFS=$'\t' read -r lines func_name filepath; do
        echo -e "${lines}\t${func_name}\t${rel_path}" >> "$TEMP_FILE"
    done
done < <(find_go_files)

# Count total functions
TOTAL=$(wc -l < "$TEMP_FILE" | tr -d ' ')

if [ "$TOTAL" -eq 0 ]; then
    echo "No Go functions found in workspace."
    rm -f "$TEMP_FILE"
    exit 0
fi

echo "Found $TOTAL functions"

# Sort by line count for percentile calculation
sort -t$'\t' -k1 -n "$TEMP_FILE" > "${TEMP_FILE}.sorted"

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
TOTAL_LINES=$(awk -F'\t' '{sum += $1} END {print sum}' "$TEMP_FILE")
AVG=$(echo "scale=1; $TOTAL_LINES / $TOTAL" | bc)

# Generate README.function.md
cat > "$OUTPUT_FILE" << EOF
# Go Function Analysis

Generated: $(date +%Y-%m-%d)

## Summary Statistics

| Percentile | Lines | Function | File |
|------------|-------|----------|------|
EOF

# Add percentile rows
echo "$P50" | awk -F'\t' '{printf "| p50        | %s     | `%s` | `%s` |\n", $1, $2, $3}' >> "$OUTPUT_FILE"
echo "$P90" | awk -F'\t' '{printf "| p90        | %s     | `%s` | `%s` |\n", $1, $2, $3}' >> "$OUTPUT_FILE"
echo "$P99" | awk -F'\t' '{printf "| p99        | %s     | `%s` | `%s` |\n", $1, $2, $3}' >> "$OUTPUT_FILE"

cat >> "$OUTPUT_FILE" << EOF

**Total functions:** $TOTAL
**Average length:** $AVG lines

## All Functions (sorted by length, descending)

| Lines | Function | File |
|-------|----------|------|
EOF

# Add all functions sorted descending
sort -t$'\t' -k1 -rn "$TEMP_FILE" | awk -F'\t' '{printf "| %s | `%s` | `%s` |\n", $1, $2, $3}' >> "$OUTPUT_FILE"

# Cleanup
rm -f "$TEMP_FILE" "${TEMP_FILE}.sorted"

echo ""
echo "Generated: $OUTPUT_FILE"
