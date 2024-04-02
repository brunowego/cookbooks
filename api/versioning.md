# API Versioning

## Learn

- [Postman / API versioning](https://postman.com/api-platform/api-versioning/)

## Terms

- API Design
- Backward Compatibility

## Types

- URI Path: `http://example.com/api/v1/products`
- Query Parameters: `http://example.com/api/products?version=1`
- Custom Header: `curl -H 'Accepts-version: 1.0' http://example.com/api/products`
- Content Negotiation: `curl -H 'Accept: application/vnd.xm.device+json; version=1' http://example.com/api/products`

<!--
- Schema Versioning
- Parameter Versioning
-->
