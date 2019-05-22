# Docker

## SGBD

- PostgreSQL
- MySQL

## Dags

```sh
docker exec -iu root airflow-app /bin/sh << 'SHELL'
cat << 'EOF' > /usr/local/airflow/dags/[name].py

EOF
SHELL
```

## Web UI

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```
