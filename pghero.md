# PgHero

<!--
https://super.writeas.com/pghero-query-stats-must-be-enabled-for-slow-queries
-->

## Links

- [Code Repository](https://github.com/ankane/pghero)

## Docker

### Configuration

```sh
# Export the DATABASE_URL environment variable
export DATABASE_URL='postgres://<user>:<password>@<host>:<port>/<dbname>'

# Test the connection
psql "$DATABASE_URL" -c 'SELECT current_database();'
psql "$DATABASE_URL" -c 'SHOW shared_preload_libraries;'
psql "$DATABASE_URL" -c 'SHOW config_file;'

#
docker container ls

export DOCKER_CONTAINER_NAME='<container-name>'

# Enable the pg_stat_statements extension
docker exec -i "$DOCKER_CONTAINER_NAME" /bin/sh -c 'sed -i "s/^#shared_preload_libraries = ''/shared_preload_libraries = 'pg_stat_statements'/" /var/lib/postgresql/data/postgresql.conf'

# Show the PostgreSQL configuration file
docker exec -i "$DOCKER_CONTAINER_NAME" /bin/sh -c 'cat /var/lib/postgresql/data/postgresql.conf'

# Create the pg_stat_statements extension
psql "$DATABASE_URL" -c 'CREATE EXTENSION IF NOT EXISTS pg_stat_statements SCHEMA public;'

# Restart the PostgreSQL server
docker restart "$DOCKER_CONTAINER_NAME"
```

### Running

```sh
#
docker run -it --rm \
  -h pghero \
  -e DATABASE_URL="$DATABASE_URL" \
  -p 8080:8080 \
  --net=host \
  --name pghero \
  docker.io/ankane/pghero:latest
```

<!--
Query stats must be enabled for slow queries
-->

<!--
SELECT * FROM pg_extension WHERE extname = 'pg_stat_statements'
SELECT count(*) FROM pg_stat_statements;
SELECT extname FROM pg_extension WHERE extname = 'pg_stat_statements';
SELECT * FROM pg_available_extensions WHERE name = 'pg_stat_statements';

ALTER SYSTEM SET shared_preload_libraries = 'pg_stat_statements';
-->
