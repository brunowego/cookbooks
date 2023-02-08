# Cross-Site Request Forgery (CSRF)

## Issues

### Trusted Origins

```log
CSRF Failed: Referer checking failed - https://sentry.domain.tld/organizations/example/projects/new/ does not match any trusted origins.
```

```py
CSRF_TRUSTED_ORIGINS = ['domain.tld']
# or
CSRF_TRUSTED_ORIGINS = list(filter(None, os.environ.get('CSRF_TRUSTED_ORIGINS', '').split(' ')))
```

### Insecure Host

```log
CSRF Failed: Referer checking failed - Referer is insecure while host is secure.
```

TODO
