# Quarkus Properties

## Quarkus Configuration

```ini
quarkus.banner.enabled = false
```

## Datasource Configuration

```ini
quarkus.datasource.db-kind = postgresql
quarkus.datasource.username = postgres
quarkus.datasource.password = postgres
quarkus.datasource.jdbc.url = jdbc:postgresql://localhost:5432/postgres
```

## Hibernate Database Configuration

```ini
quarkus.hibernate-orm.database.generation.create-schemas = true
quarkus.hibernate-orm.database.default-schema = example
```

[**Suggestions**](https://quarkus.io/blog/hibernate-orm-config-profiles/)

```ini
%dev.quarkus.hibernate-orm.database.generation = drop-and-create
%dev-with-data.quarkus.hibernate-orm.database.generation = update
%prod.quarkus.hibernate-orm.database.generation = none
%prod.quarkus.hibernate-orm.sql-load-script = no-file
```

## [Context Path Configuring](https://quarkus.io/guides/http-reference#configuring-the-context-path)

```ini
quarkus.http.root-path = /api
```

## HTTP CORS Filter

```ini
quarkus.http.cors = true
quarkus.http.cors.origins = http://localhost:3000,https://example.com
```

## OIDC Configuration

```ini
quarkus.oidc.auth-server-url = http://localhost:8180/auth/realms/example
quarkus.oidc.client-id = example-backend-api

# quarkus.oidc.credentials.secret = 45bed3c0-5d6c-4722-be84-7ac42d791f5e
# quarkus.oidc.tls.verification = none
```

## Enable Policy Enforcement

```ini
# quarkus.keycloak.policy-enforcer.enable = true
%test.quarkus.http.auth.basic = true
```
