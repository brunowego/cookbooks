# Docker Stack

## Running

```sh
#
docker compose build

#
docker compose run --rm api python3 manage.py migrate
docker compose run --rm api python3 manage.py populatedb --createsuperuser

#
docker compose up
# Backend services only
docker compose up api worker
```

## Services

| Service                        | URL                    |
| ------------------------------ | ---------------------- |
| Saleor Core (API)              | http://localhost:8000  |
| Saleor Dashboard               | http://localhost:9000  |
| Jaeger UI (APM)                | http://localhost:16686 |
| Mailpit (Test email interface) | http://localhost:8025  |

## Credentials

| Login               | Password |
| ------------------- | -------- |
| `admin@example.com` | `admin`  |
