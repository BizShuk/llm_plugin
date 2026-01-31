---
name: Go Convention
trigger: always_on
description: This is golang naming convention for variables and functions
globs: "**/*.go"
scope: "**/*.go"
---

# Go Convention

## Summary

| Element           | Convention             | Example           |
| ----------------- | ---------------------- | ----------------- |
| Constants         | `SCREAMING_SNAKE_CASE` | `MAX_RETRY_COUNT` |
| File names        | `snake_case`           | `user_service.go` |
| Functions/Methods | `CamelCase`            | `GetUserProfile`  |
| Structs           | `CamelCase`            | `UserProfile`     |
| Variables         | `camelCase`            | `userName`        |
| Indent            | 4 spaces               | —                 |

---

## Constants

Use `SCREAMING_SNAKE_CASE` for constant variables.

```go
// Good
const MAX_RETRY_COUNT = 3
const API_BASE_URL = "https://api.example.com"
const DEFAULT_TIMEOUT_SECONDS = 30

// Bad
const maxRetryCount = 3
const MaxRetryCount = 3
```

---

## File Names

Use `snake_case` for file names when a single term cannot represent the meaning.

```
// Good
user_service.go
order_handler.go
payment_config.go

// Bad
userService.go
UserService.go
user-service.go
```

---

## Functions, Methods & Structs

Use `CamelCase` (PascalCase) for exported, `camelCase` for unexported.

```go
// Good - Exported (public)
func GetUserProfile(userID string) (*UserProfile, error) {
    return fetchProfile(userID)
}

type UserProfile struct {
    ID        string
    FirstName string
    LastName  string
}

// Good - Unexported (private)
func fetchProfile(userID string) (*UserProfile, error) {
    // internal implementation
}

type userCache struct {
    data map[string]*UserProfile
}
```

---

## Variables

Use `camelCase` for local variables and struct fields.

```go
// Good
func ProcessOrder(orderID string) error {
    userName := "john"
    maxRetries := 3
    isActive := true

    return nil
}

// Bad
func ProcessOrder(orderID string) error {
    UserName := "john"      // looks like exported
    max_retries := 3        // snake_case not idiomatic

    return nil
}
```

---

## Indentation

Use 4 spaces for indentation (configure your editor).

```go
// Good - 4 spaces
func Example() {
    if condition {
        doSomething()
        for i := 0; i < 10; i++ {
            process(i)
        }
    }
}
```
