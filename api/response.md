# API Response

## Standards Formats

- [Google JSON](https://google.github.io/styleguide/jsoncstyleguide.xml)
- [HAL](https://stateless.co/hal_specification.html)
- [JSend](https://github.com/omniti-labs/jsend) 🌟
- [JSON:API](https://jsonapi.org)
- [OData JSON Protocol](http://docs.oasis-open.org/odata/odata-json-format/v4.0/errata02/os/odata-json-format-v4.0-errata02-os-complete.html#_Toc403940655)

## Examples

<!--
https://api.acme.com -> https://developers.acme.com 🌟
https://api.acme.com -> OpenAPI
-->

### JSend

**Successful Request:**

```json
{
  "status": "success",
  "data": {
    // ...
  },
  "message": null
}
```

**Failed Request:**

```json
{
  "status": "error",
  "data": null,
  "message": "Error xyz has occurred"
}
```
