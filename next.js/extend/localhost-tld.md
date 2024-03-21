# Extend with Localhost TLD

## Dependencies

- [.localhost as TLD](/dnsmasq/tld/localhost.md)

## Configuraiton

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "dev": "next dev -H console.acme.localhost",
    // ...
    "start": "next start -H console.acme.localhost"
  }
  // ...
}
```
