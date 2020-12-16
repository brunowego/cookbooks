# Django Secure

##

### HTTP Strict Transport Security (HSTS)

| Seconds | Age |
| --- | --- |
| `15724800` | `60 * 60 * 24 * 182` | 6 months |
| `31536000` | `60 * 60 * 24 * 365` | 1 Year |
| `63072000` | `60 * 60 * 24 * 365 * 2` | 2 Years |
| `94608000` | `60 * 60 * 24 * 365 * 3` | 3 Years |

```py
# Security
# https://docs.djangoproject.com/en/3.1/ref/settings/#secure-hsts-seconds

SECURE_HSTS_SECONDS = env.int('SECURE_HSTS_SECONDS', 31536000)
SECURE_HSTS_INCLUDE_SUBDOMAINS = True
```

### X Content Type Options

```py
# Security
# https://docs.djangoproject.com/en/3.1/ref/settings/#secure-content-type-nosniff

SECURE_CONTENT_TYPE_NOSNIFF = True
```
