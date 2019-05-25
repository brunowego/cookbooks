# Docker

## SGBD

- PostgreSQL
- MySQL

## Dags

```sh
docker exec -iu root airflow-app /bin/sh << 'EOSHELL'
cat << 'EOF' > /usr/local/airflow/dags/[name].py

EOF
EOSHELL
```

## Root

```sh
docker exec -itu root airflow-app /bin/bash
```

## Web UI

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```
