# Docker

## SGBD

- PostgreSQL
- MySQL

## Dags

```sh
docker exec -iu root airflow /bin/sh << EOSHELL
cat << EOF > /usr/local/airflow/dags/[name].py

EOF
EOSHELL
```

### List

```sh
docker exec -i airflow ls /usr/local/airflow/dags
```

## Root

```sh
docker exec -itu root airflow /bin/bash
```

## Web UI

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```
