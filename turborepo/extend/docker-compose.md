# Extend with Docker Compose

## Configuration

**Refer:** `./docker-compose.yml`

```yml
---
services:

volumes:
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "compose:up": "docker compose up -d",
    "compose:status": "docker compose ps",
    "compose:restart": "docker compose restart",
    "compose:down": "docker compose down"
    // ...
  }
  // ...
}
```
