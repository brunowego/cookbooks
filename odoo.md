# Odoo (a.k.a OpenERP)

## Links

- [Code Repository](https://github.com/odoo/odoo)
- [Main Website](https://odoo.com)

## References

- [Odoo Data Model](https://soft-builder.com/en/docs/Odoo/index.html)

<!--
https://odoo.com/documentation/15.0/developer/tutorials/getting_started/01_architecture.html
https://erpsolutions.oodles.io/blog/odoo-architecture-technical-deployment/
-->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -v odoo-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER='odoo' \
  -e POSTGRES_PASSWORD='odoo' \
  -p 5432:5432 \
  --name odoo-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h odoo \
  -v odoo-data:/var/lib/odoo \
  -v odoo-addons:/mnt/extra-addons \
  -e DB_DRIVER=pgsql \
  -e DB_PORT_5432_TCP_ADDR=odoo-postgres \
  -e DB_PORT_5432_TCP_PORT=5432 \
  -e DB_ENV_POSTGRES_USER=odoo \
  -e DB_ENV_POSTGRES_PASSWORD=odoo \
  -p 8069:8069 \
  --name odoo \
  --network workbench \
  docker.io/library/odoo:16.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8069'
```

### Remove

```sh
docker rm -f odoo-postgres odoo

docker volume rm odoo-postgres-data odoo-data odoo-addons
```
