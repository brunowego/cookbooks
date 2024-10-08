# Models

## Links

- [Syntax](https://mermaid.js.org/syntax/classDiagram.html)

## Diagram

```mermaid
classDiagram
    direction RL
    class User {
        <<interface>>
        +id : int
        +email : string
        -password : string
    }

    class Ticket {
        <<interface>>
        +id : string
        +title : string
        +price : float
        +version : int
        +userId : User
        +orderId ?: Order
    }

    class Order {
        <<interface>>
        +id : string
        +title : string
        +status : OrderStatus
        +version : int
        +ticketId : Ticket
        +userId : User
    }

    class OrderStatus{
        <<enumeration>>
        Created
        Cancelled
        Complete
        AwaitingPayment
    }

    class Payment {
        <<interface>>
        +id : string
        +orderId : string
        +stripeId : OrderStatus
        +version : int
    }

    User "1" --> "*" Ticket
    User "1" --> "*" Order
    Ticket "1" --> "1" Order
    Order ..> OrderStatus
    Payment "1" --> "1" Order
```
