---
name: clean-unused-code
description: Find and remove unused code in projects. This skill should be used when cleaning up dead code, removing unreachable functions, or optimizing codebase by eliminating unused code. Currently supports Golang projects.
---

# Clean Unused Code

## Overview

This skill provides workflows for finding and removing unused code in projects. It uses static analysis tools to identify unreachable functions and dead code.

## When to Use

Use this skill when:

- Cleaning up dead code in a project
- Removing unreachable functions
- Optimizing codebase size
- Preparing for code review or release

## Supported Languages

| Language | Tool       | Install Command                                     |
| -------- | ---------- | --------------------------------------------------- |
| `golang` | `deadcode` | `go install golang.org/x/tools/cmd/deadcode@latest` |

---

## Golang Projects

### Prerequisites

Install the `deadcode` tool:

```bash
go install golang.org/x/tools/cmd/deadcode@latest
```

### Step 1: Find Unused Code

Run `deadcode` from the project root:

```bash
deadcode ./...
```

For projects with test dependencies, include tests:

```bash
deadcode -test ./...
```

### Step 2: Parse Output

The output format is:

```
<file>:<line>:<column>: unreachable func: <function_name>
```

Example output:

```
internal/utils/helper.go:45:1: unreachable func: unusedHelper
pkg/service/old.go:12:1: unreachable func: deprecatedMethod
```

### Step 3: Review and Remove

For each unreachable function:

1. **Verify** it is safe to remove (not called via reflection, not an interface implementation)
2. **Remove** the function definition
3. **Remove** any related imports that become unused
4. **Run** `go build ./...` to verify no build errors

### Step 4: Clean Up Imports

After removing functions, clean up unused imports:

```bash
goimports -w .
```

Or use `gopls` organize imports functionality.

---

## Caveats

> [!WARNING]
> `deadcode` may not detect functions called via:
>
> - Reflection (`reflect.ValueOf().MethodByName()`)
> - Interface implementations used through dependency injection
> - CGo bindings
> - Plugin systems

### When to Skip Removal

Do NOT remove functions if:

- They implement an interface (even if not directly called)
- They are exported and part of a public API/library
- They are called via reflection
- They are test helpers used in `_test.go` files (use `-test` flag)

---

## Verification

After cleaning, verify the project:

```bash
# Build check
go build ./...

# Test check
go test ./...

# Run deadcode again to confirm
deadcode ./...
```
