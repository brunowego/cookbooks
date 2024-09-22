# CRUD Operations

**Keywords:** Design Pattern

## Operations

- `GET /items`: Retrieves a list of all items (corresponds to `findAll`).
- `GET /items?catId=1`: Retrieves a filtered list of items based on provided query parameters (corresponds to `findAllByParams`).
- `GET /items/:id`: Retrieves a single item by its unique identifier (corresponds to `findById` or `getById`).
- `POST /items`: Creates a new item in the collection (corresponds to `create`).
- `PUT /items/:id`: Fully updates an existing item by its unique identifier (corresponds to `update`).
- `PATCH /items/:id`: Partially updates an existing item by its unique identifier (corresponds to `update`).

## Tips

### GET with Query Parameters (Recommended for filtering lists)

- Endpoint: `GET /items?param=value`
- Use Case: This approach is ideal when you want to filter a list of items based on one or more parameters (e.g., category, status). It allows for multiple filters and returns a list that matches the criteria.
- Example: `GET /items?catId=1&status=active` — Returns all items that match the catId and status parameters.

### GET with Path Parameters (Recommended for specific, unique searches)

- Endpoint: `GET /items/by-param/:paramValue`
- Use Case: This approach is better suited when searching for a specific item that should uniquely match the given parameter (similar to finding by ID). It conveys that the result should be a single item, not a list.
- Example: `GET /items/by-serial/:serialNumber` — Returns the item with the specific serial number.

<!--
findAllByParams -> LIST
findByParams or findOneByParams -> SINGLE
-->
