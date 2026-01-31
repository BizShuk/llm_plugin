---
name: Go Testing
trigger: always_on
description: Golang Testing Principle
globs: "**/*.go"
scope: "**/*.go"
---

# Go Testing

Functions, methods, and structs fall into two categories for testing purposes.

## Summary

| Category       | Testing Approach             | Examples                              |
| -------------- | ---------------------------- | ------------------------------------- |
| **Aggregated** | Integration/Scenario testing | `handler/`, `controller/`             |
| **Simple**     | Unit testing                 | `svc/`, `model/`, `config/`, `utils/` |

---

## Aggregated (Integration Testing)

Components that orchestrate multiple services together.

- **What**: Handlers, controllers, orchestrators
- **Why**: These combine business logic from multiple sources
- **Testing**: Business scenario / integration tests
- **Don't**: Write unit tests for this layer

```go
// handler/order_handler.go - Test as integration
func ProcessOrder(order *Order) error {
    user := svc.GetUser(order.UserID)      // calls service
    payment := svc.ProcessPayment(order)   // calls service
    return svc.SendConfirmation(user)      // calls service
}
```

---

## Simple (Unit Testing)

Single-responsibility components with focused logic.

- **What**: Services, models, configs, utils
- **Why**: These contain isolated, testable logic
- **Testing**: Unit tests with mocks/stubs
- **Focus**: Test edge cases, error paths, business rules

```go
// svc/payment_service.go - Unit test this
func CalculateDiscount(amount float64, tier string) float64 {
    switch tier {
    case "gold":
        return amount * 0.20
    case "silver":
        return amount * 0.10
    default:
        return 0
    }
}

// svc/payment_service_test.go
func TestCalculateDiscount(t *testing.T) {
    tests := []struct {
        amount   float64
        tier     string
        expected float64
    }{
        {100, "gold", 20},
        {100, "silver", 10},
        {100, "bronze", 0},
    }

    for _, tt := range tests {
        result := CalculateDiscount(tt.amount, tt.tier)
        if result != tt.expected {
            t.Errorf("got %v, want %v", result, tt.expected)
        }
    }
}
```
