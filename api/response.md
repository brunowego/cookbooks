# API Response

## Standards Formats

- [AWS API Documentation](https://docs.aws.amazon.com/general/latest/gr/aws-apis.html)
- [Azure API Guidelines](https://github.com/microsoft/api-guidelines/blob/vNext/azure/Guidelines.md)
- [Envelope Pattern](https://endpoints.dev/best-practices/responses-and-error-handling)
- [Facebook Graph API](https://developers.facebook.com/docs/graph-api/reference)
- [GitHub API](https://docs.github.com/en/rest)
- [Google JSON Style Guide](https://google.github.io/styleguide/jsoncstyleguide.xml)
- [HAL](https://stateless.co/hal_specification.html)
- [Heroku Platform API](https://devcenter.heroku.com/articles/platform-api-reference)
- [Hyperbus](http://hyperbus.github.io)
- [JSend](https://github.com/omniti-labs/jsend) 🌟
- [JSON:API](https://jsonapi.org)
- [Microsoft REST API Guidelines](https://github.com/microsoft/api-guidelines)
- [OData JSON Protocol](http://docs.oasis-open.org/odata/odata-json-format/v4.0/errata02/os/odata-json-format-v4.0-errata02-os-complete.html#_Toc403940655)
- [OpenAPI (formerly Swagger)](https://swagger.io/specification)
- [PayPal API](https://developer.paypal.com/api/rest)
- [Problem Details (RFC 7807)](https://datatracker.ietf.org/doc/html/rfc7807)
- [Stripe API](https://stripe.com/docs/api)
- [Twitter API](https://developer.twitter.com/en/docs/twitter-api)
- [Zalando RESTful API Guidelines](https://opensource.zalando.com/restful-api-guidelines)

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
