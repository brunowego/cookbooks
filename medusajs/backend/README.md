# Medusa Backend

<!--
PORT=9000

http://localhost:9000/health
-->

## Issues

### Rollback SDK version

```log
TypeError: Cannot read properties of undefined (reading 'cache')
```

**Refer:** `./package.son`

```json
{
  // ...
  "resolutions": {
    "@medusajs/modules-sdk": "1.12.2"
  }
}
```
