# Flyway

## Links

- [Code Repository](https://github.com/flyway/flyway)

## Guides

- [Database Migrations with Flyway](https://www.baeldung.com/database-migrations-with-flyway)

## CLI

### Installation

```sh
# Using Homebrew
brew install flyway

# Using Chocolatey
choco install flyway.commandline
```

### Commands

```sh
flyway -h
```

<!-- ### Usage

```sh
#
flyway migrate \
  -url=... \
  -user=... \
  -password=...

#
flyway -configFiles=./src/main/resources/flyway.properties migrate

#
flyway migrate \
    -driver=org.postgresql.Driver \
    -url=jdbc:postgresql://localhost:5432/marquez \
    -user=marquez \
    -password=*** \
    -locations=filesystem:path/to/marquez/db/migration

#
mvn flyway:info

#
mvn clean compile flyway:migrate -Dflyway.configFile=myFlywayConfig.properties

#
flyway info -url=jdbc:h2:mem:FlyWay-Test -user=sa -password=s3cr3t
``` -->
