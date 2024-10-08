# Events

## Links

- [Syntax](https://mermaid.js.org/syntax/sequenceDiagram.html)

## Diagram

```mermaid
sequenceDiagram
    participant Tickets service
    participant Orders service
    participant Payments service
        participant Expiration service
        participant NATS

    loop ticket:created
        %% event emitted by tickets service
        Tickets service->>+NATS: Publish new ticket
        NATS-->>-Orders service: Dispatch new ticket
        Note left of Orders service: Orders service needs to know <br> about tickets that can be reserved.
    end

    loop ticket:updated
        %% event emitted by tickets service
        Tickets service->>+NATS: Publish updated ticket
        NATS-->>-Orders service: Dispatch updated ticket
        Note left of Orders service: Orders service needs to know <br> if tickets price have changed and <br>if they are successfully reserved
    end

    loop order:created
        %% event emitted by orders service
        Orders service->>+NATS: Publish new order
        par NATS to Tickets service
            NATS->>Tickets service: Dispatch new order
            Note left of Tickets service: Tickets service needs to know<br>if a ticket has been reserved<br>to prevent its edition.
            and NATS to Payments service
            NATS->>Payments service: Dispatch new order
            Note left of Payments service: Payments service needs to know<br>there is a new order that a user<br>might submit a payment for.
            and NATS to Expiration service
            NATS->>Expiration service: Dispatch new order
            Note left of Expiration service: Expiration service needs to start<br>a timer to eventually time out<br>this order.
            end
    end


    loop order:cancelled
        %% event emitted by orders service
        Orders service->>+NATS: Publish cancelled order
        par NATS to Tickets service
            NATS->>Tickets service: Dispatch cancelled order
            Note left of Tickets service: Tickets service should unreserve ticket<br>if the corresponding order has been<br>cancelled so this ticket can be <br>edited again
            and NATS to Payments service
            NATS->>Payments service: Dispatch cancelled order
            Note left of Payments service: Payments service should know that<br>any incoming payments for this order<br>should be rejected
        end
    end

    loop expiration:complete
        %% event emitted by expiration service
        Expiration service->>+NATS: Publish complete expiration
        par NATS to Orders service
            NATS->>Orders service: Dispatch expired order
            Note left of Orders service: Orders service needs to know that an order<br>has gone over the 15 minutes time limit.<br>It is up to the order service to decide<br> wether or not to cancel the order.
            end
    end

    loop payment:created
        %% event emitted by payments service
        Payments service->>+NATS: Publish payment created
        par NATS to Orders service
            NATS->>Orders service: Dispatch payment created
            Note left of Orders service: Orders service needs to know that an order<br>has been paid for.
            end
    end
```
