# Local Development

## Guides

- [Local Development with Neon](https://neon.tech/guides/local-development-with-neon)
  - [Database branching](https://neon.tech/guides/local-development-with-neon#database-branching)
  - [Local PostgreSQL](https://neon.tech/guides/local-development-with-neon#local-postgresql)

## Local PostgreSQL

```yml
---
services:
  postgres:
    image: docker.io/library/postgres:17
    volumes:
      - type: volume
        source: postgresql-data
        target: /var/lib/postgresql/data
    environment:
      POSTGRES_DB:
      POSTGRES_USER:
      POSTGRES_PASSWORD:
    command: '-d 1'
    ports:
      - target: 5432
        published: $POSTGRES_PORT
        protocol: tcp
    healthcheck:
      test: ['CMD-SHELL', 'pg_isready -U postgres']
      interval: 10s
      timeout: 5s
      retries: 5
    restart: unless-stopped

  neon-proxy:
    image: ghcr.io/timowilhelm/local-neon-http-proxy:main
    environment:
      PG_CONNECTION_STRING: postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@postgres:5432/$POSTGRES_DB
    ports:
      - target: 4444
        published: $NEON_PROXY_PORT
        protocol: tcp
    depends_on:
      postgres:
        condition: service_healthy

volumes:
  postgresql-data:
    driver: local
```
