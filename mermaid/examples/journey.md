# Journey

## Links

- [Syntax](https://mermaid.js.org/syntax/journey.html)

## Diagram

```mermaid
journey
    title Exchanging Tickets
    section Register
        Create a user: 3: Seller, Buyer
        Signin : 3: Seller
    section Search tickets
        Find by name: 5: Buyer, Seller
    section Create ticket offer
        Write description: 3: Seller
        Define price: 3: Seller
    section Buy ticket
        Reserve tickets: 5: Buyer
        Place order: 3: Buyer
        Pay ticket: 3: Buyer
    section Check orders
        See orders list: 5: Seller, Buyer
```
