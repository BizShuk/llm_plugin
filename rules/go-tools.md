---
name: Go Tools
trigger: always_on
description: Golang SDK to use by default
globs: "**/*.go"
scope: "**/*.go"
---

# Go Tools

This is the language I prefer by default if project level GEMINI.md is not explicitly mentioning the programming language to use.

## Default SDKs

| SDK                        | Purpose                           |
| -------------------------- | --------------------------------- |
| `github.com/bizshuk/gosdk` | Custom utilities & config wrapper |
| `github.com/go-gorm/gorm`  | ORM for database operations       |
| `github.com/spf13/viper`   | Configuration management          |
| `github.com/spf13/cobra`   | CLI framework                     |
| `go.uber.org/zap`          | Structured logging                |

---

### github.com/bizshuk/gosdk

Custom SDK with utilities and wrappers for common operations.

- Wrapper around `viper` for default configuration loading
- Common helper functions used across projects
- Use this for config initialization

---

### github.com/go-gorm/gorm

ORM (Object-Relational Mapping) for database interactions.

- Use for all database CRUD operations
- Define models with GORM tags for mapping
- Supports MySQL, PostgreSQL, SQLite, SQL Server

```go
type User struct {
    gorm.Model
    Name  string
    Email string `gorm:"uniqueIndex"`
}
```

---

### github.com/spf13/viper

Configuration management for Go applications.

- Read config from files (JSON, YAML, TOML, etc.)
- Environment variable binding
- Live config watching

```go
viper.SetConfigName("config")
viper.AddConfigPath(".")
viper.ReadInConfig()

dbHost := viper.GetString("database.host")
```

---

### github.com/spf13/cobra

CLI framework for building command-line applications.

- Sub-command support
- Flag parsing (persistent and local)
- Auto-generated help

```go
var rootCmd = &cobra.Command{
    Use:   "app",
    Short: "Application description",
    Run: func(cmd *cobra.Command, args []string) {
        // main logic
    },
}
```

---

### go.uber.org/zap

High-performance structured logging.

- **Rule**: Every error handling MUST include a log statement
- Use structured fields for context
- Supports JSON and console output

```go
logger, _ := zap.NewProduction()
defer logger.Sync()

// Error handling - always log errors
if err != nil {
    logger.Error("failed to process",
        zap.String("userID", userID),
        zap.Error(err),
    )
    return err
}

// Info logging
logger.Info("user created",
    zap.String("userID", userID),
)
```
