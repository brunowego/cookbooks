# Quarkus Flyway

<!--
https://www.youtube.com/watch?v=WWS2xceDJNI
-->

## Guides

- [Using Flyway](https://quarkus.io/guides/flyway)

## Dependencies

```sh
#
docker network create workbench \
  --subnet 10.1.1.0/24

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='user' \
  -e POSTGRES_PASSWORD='pass' \
  -e POSTGRES_DB='dev' \
  -v postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name quarkus-postgresql \
  --network workbench \
  docker.io/library/postgres:12.6-alpine

#
docker exec -i quarkus-postgresql psql \
  -U user \
  -d dev \
  -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
```

## Configuration

```sh
#
mvn quarkus:add-extension \
  -Dextensions='flyway'
```

**Attention:** Remove property `quarkus.hibernate-orm.database.generation`.

```ini
quarkus.flyway.clean-at-start = true
quarkus.flyway.migrate-at-start = true
```

```sh
#
mkdir -p ./src/main/resources/db/migration

#
cat << \EOF > ./src/main/resources/db/migration/V1.0__create_users_table.sql
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) NOT NULL
);

INSERT INTO users (id, email) VALUES (uuid_generate_v4(), 'admin@xyz.tld');
EOF

#
mvn compile quarkus:dev
```

<!--
%dev.quarkus.flyway.locations = db/migration,db/testdata

# quarkus.flyway.baseline-on-migrate = true
# quarkus.flyway.baseline-version = 1.0.0
# quarkus.flyway.baseline-description = Initial version
# quarkus.flyway.connect-retries = 10
# quarkus.flyway.schemas = TEST_SCHEMA
# quarkus.flyway.table = flyway_quarkus_history
# quarkus.flyway.locations = db/location1,db/location2
# quarkus.flyway.sql-migration-prefix = X
# quarkus.flyway.repeatable-sql-migration-prefix = K
-->
