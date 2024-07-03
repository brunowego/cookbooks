# Representational State Transfer (REST)

<!--
https://linkedin.com/learning/paths/become-a-restful-api-developer

https://linkedin.com/learning/programming-foundations-apis-and-web-services/communicate-on-the-web-using-services
https://linkedin.com/learning/introduction-to-web-apis/what-is-an-api
https://linkedin.com/learning/learning-rest-apis/welcome
https://linkedin.com/learning/designing-restful-apis/welcome
https://linkedin.com/learning/api-testing-and-validation/welcome

https://linkedin.com/learning/building-apis-with-swagger-and-the-openapi-specification/open-source-tools
https://linkedin.com/learning/building-apis-with-swagger-and-the-openapi-specification/building-apis-with-swagger

https://app.pluralsight.com/library/courses/rest-fundamental/table-of-contents
https://www.youtube.com/watch?v=_1xa8Bsho6A
-->

![REST API Design](/assets/images/api/rest-api-design.jpeg)

## Alternatives

- [GraphQL](/graphql/README.md)
- [Remote Procedure Call (RPC)](/rpc.md)
- [Simple Object Access Protocol (SOAP)](/soap.md)

## References

- [REST API Versioning](https://restfulapi.net/versioning/)
- HATEOAS

## Tools

- [{JSON} Placeholder](https://jsonplaceholder.typicode.com)
- Apiary
- Swagger
- WADL
- [REST Client](/rest-client.md)
- [RequestBin](https://requestbin.net)

## Demo REST APIs

- [GitHub API](https://api.github.com)
- [{JSON} Placeholder](https://jsonplaceholder.typicode.com)
- [Reqres](https://reqres.in/)

## Comparing Web API vs REST API

- Web API
  - A more general term
  - An API that understands HTTP
- REST API
  - A Web API
  - Designed according to RESTful principles

## Safe or Not

| HTTP method | Request has body | Safe |
| ----------- | ---------------- | ---- |
| GET         | No               | Yes  |
| POST        | Yes              | No   |
| PUT         | Yes              | No   |
| DELETE      | Yes              | No   |

### Simple and Safe Methods

- GET
  - Retrieve data only
  - No side-effects
- HEAD
  - Get headers only, no body
- OPTIONS
  - List of supported HTTP methods

### Destructive Methods

- POST
  - Create from the Request's body
- PUT
  - Create or overwrite an existing resource
- PATCH
  - Apply partial modifications
- DELETE

### Honorable Mention

- TRACE
- CONNECT

## Markdown

```http
GET http://github.com
```

```rest
GET http://github.com
```

## Anatomy

### Headers

- Cookies
- Pagination
- Proxies
- Connection types

### Body

- Data
