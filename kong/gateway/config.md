# Kong Gateway Config

## Manifest

**Refer:** `./kong.yml`

```yml
---
_format_version: '3.0'

services:
  - name: web
    url: http://host.docker.internal:3000
    routes:
      - name: web
        paths:
          - /

  - name: api
    url: http://host.docker.internal:3001
    routes:
      - name: api
        paths:
          - /api

plugins:
  - name: rate-limiting
    config:
      second: 5
      hour: 10000
      policy: local
```

**Refer:** `./kong.conf`

```conf
plugins = bundled, opaque-jwt
```
