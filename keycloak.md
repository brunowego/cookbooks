# Keycloak

## Docker

### Volume

```sh
docker volume create keycloak-postgres-data
```

### Running

```sh
docker run -d \
  -h postgres.keycloak.local \
  -e POSTGRES_USER=keycloak \
  -e POSTGRES_PASSWORD=keycloak \
  -e POSTGRES_DB=keycloak \
  -v keycloak-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name keycloak-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h keycloak.local \
  -e DB_VENDOR=postgres \
  -e DB_ADDR=keycloak-postgres \
  -e DB_USER=keycloak \
  -e DB_PASSWORD=keycloak \
  -e DB_DATABASE=keycloak \
  -e DB_SCHEMA=public \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin \
  -p 8080:8080 \
  -p 8443:8443 \
  --name keycloak \
  --restart always \
  --link keycloak-postgres \
  jboss/keycloak:6.0.1
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

### Remove

```sh
docker rm -f keycloak-postgres keycloak
docker volume rm keycloak-postgres-data
```
