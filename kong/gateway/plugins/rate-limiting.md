# Rate Limiting

## Links

- [Docs](https://docs.konghq.com/hub/kong-inc/rate-limiting)

## Related

- [Distributed Denial-of-Service (DDoS)](/cyber-security/ddos.md)

## Configuration

**Refer:** `./kong.yml`

```yml
---
# ...

plugins:
  # ...
  - name: rate-limiting
    config:
      second: 5
      hour: 10000
      policy: local
```
