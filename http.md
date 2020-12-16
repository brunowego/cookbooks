# Hypertext Transfer Protocol (HTTP)

<!--
https://geekflare.com/http-header-implementation/
-->

## References

- [Message Headers](https://www.iana.org/assignments/message-headers/message-headers.xhtml)
- [HTTP response status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)

## Tools

- [httpbin.org](https://httpbin.org/)

## HTTP Methods

| Method |
| --- |
| GET |
| POST |
| PUTT |
| HEAD |
| OPTIONS |
| DELETE |
| PATCH |

## Issues

<!-- ###

X-Frame-Options: SAMEORIGIN -->

<!-- ###

X-XSS-Protection: 1; mode=block -->

### HTTP Strict Transport Security (HSTS)

```log
Strict-Transport-Security: The connection to the site is untrustworthy, so the specified header was ignored.
```

```sh
curl -I 'https://example.com' | \
  grep -i 'Strict-Transport-Security'
```

```http
Strict-Transport-Security: max-age=31536000; includeSubDomains
```

#### Firefox

1. Preferences
2. Privacy & Security
3. Certificates -> View Certificates
4. Authorities Tab -> Import -> `.der` file

### X Content Type Options

```log
The resource from “https://example.com/static/css/app.css” was blocked due to MIME type (“text/html”) mismatch (X-Content-Type-Options: nosniff).
```

```sh
curl -I 'https://example.com' | \
  grep -i 'X-Content-Type-Options'
```

```http
X-Content-Type-Options: nosniff
```

```html
<link rel="stylesheet" href="/static/css/app.css">
<!-- To -->
<link rel="stylesheet" type="text/css" href="/static/css/app.css">

<script src="/static/js/app.js"></script>
<!-- To -->
<script type="text/javascript" src="/static/js/app.js"></script>
```

<!--
Django issue with uWSGI
-->
