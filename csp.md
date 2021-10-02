# Content Security Policy (CSP)

## Guides

- [Web Fundamentals - Content Security Policy](https://developers.google.com/web/fundamentals/security/csp)

## Usage

### HTML

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; connect-src http://127.0.0.1:8080; script-src 'self' 'unsafe-inline' http://127.0.0.1:8080; img-src 'self' http://127.0.0.1:8080; style-src 'self'; frame-ancestors 'self'; frame-src 'self';">
```
