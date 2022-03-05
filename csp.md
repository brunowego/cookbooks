# Content Security Policy (CSP)

## Guides

- [Web Fundamentals - Content Security Policy](https://developers.google.com/web/fundamentals/security/csp)
- [Content Security Policy (CSP) - Quick Reference Guide](https://content-security-policy.com/)

## Usage

### HTML

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; connect-src http://127.0.0.1:8080; script-src 'self' 'unsafe-inline' http://127.0.0.1:8080; img-src 'self' http://127.0.0.1:8080; style-src 'self'; frame-ancestors 'self'; frame-src 'self';">
```

## Issues

### Unsafe Eval Script

```log
Uncaught EvalError: Refused to evaluate a string as JavaScript because 'unsafe-eval' is not an allowed source of script in the following Content Security Policy directive: "default-src 'self'".
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' 'unsafe-eval';">
```

### Unsafe Inline Script

```log
Refused to execute inline script because it violates the following Content Security Policy directive: "script-src 'self' 'unsafe-eval'". Either the 'unsafe-inline' keyword, a hash ('sha256-d/85T/fs9BX2ko49HUesd3h/o1E4+6DUWxhzQO8Itc4='), or a nonce ('nonce-...') is required to enable inline execution.
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' 'unsafe-inline';">
```

<!-- ###

```log
Error while trying to use the following icon from the Manifest: https://assets.boxfeed.co/apple-touch-icon-144x144.png (Download error or resource isn't a valid image)
```

```html
``` -->

### External Font

```log
Refused to load the font '<URL>' because it violates the following Content Security Policy directive: "default-src 'self'". Note that 'font-src' was not explicitly set, so 'default-src' is used as a fallback.
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; font-src 'self' fonts.gstatic.com;">
```

### External Style

```log
Refused to load the stylesheet 'https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap' because it violates the following Content Security Policy directive: "default-src 'self'". Note that 'style-src-elem' was not explicitly set, so 'default-src' is used as a fallback.
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' *.googleapis.com;">
```

### Unsafe Style

```log
Refused to apply inline style because it violates the following Content Security Policy directive: "default-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-4/2nIlfwIVTJ1+JcNQ6LkeVWzNS148LKAJeL5yofdN4='), or a nonce ('nonce-...') is required to enable inline execution. Note also that 'style-src' was not explicitly set, so 'default-src' is used as a fallback.
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' 'unsafe-inline';">
```

### URL Image

```log
Refused to load the image '<URL>' because it violates the following Content Security Policy directive: "default-src 'self'". Note that 'img-src' was not explicitly set, so 'default-src' is used as a fallback.
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; img-src 'self' *.example.com;">
```

### Encoded Image

```log
Refused to load the image 'data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%27469%27%20height=%27409%27/%3e' because it violates the following Content Security Policy directive: "img-src 'self' *.example.com".
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; img-src 'self' data:;">
```

### Google Tag Manager

```log
Refused to load the script 'https://www.googletagmanager.com/gtag/js?id=G-MMGHY9CX0E' because it violates the following Content Security Policy directive: "script-src 'self' 'unsafe-eval' 'unsafe-inline'". Note that 'script-src-elem' was not explicitly set, so 'script-src' is used as a fallback.
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' *.googletagmanager.com;">
```

###

```log
Refused to connect to '<URL>' because it violates the following Content Security Policy directive: "default-src 'self'". Note that 'connect-src' was not explicitly set, so 'default-src' is used as a fallback.
```

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; connect-src *;">
```
