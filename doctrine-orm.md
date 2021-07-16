# Doctrine Object Relational Mapper (ORM)

## Links

- [Code Repository](https://github.com/doctrine/orm)
- [Main Website](https://doctrine-project.org/)

## CLI

### Commands

```sh
bin/console doctrine:database:create -h
bin/console doctrine:database:drop -h
bin/console doctrine:database:import -h
bin/console doctrine:migrations:current -h
bin/console doctrine:migrations:diff -h
bin/console doctrine:migrations:dump-schema -h
bin/console doctrine:migrations:execute -h
bin/console doctrine:migrations:generate -h
bin/console doctrine:migrations:latest -h
bin/console doctrine:migrations:list -h
bin/console doctrine:migrations:migrate -h
bin/console doctrine:migrations:rollup -h
bin/console doctrine:migrations:status -h
bin/console doctrine:migrations:sync-metadata-storage -h
bin/console doctrine:migrations:up-to-date -h
bin/console doctrine:migrations:version -h
bin/console doctrine:query:sql -h
```

### Usage

#### Database

```sh
#
bin/console doctrine:database:create --env=dev
```

#### Schema

```sh
#
bin/console doctrine:schema:update --force
```

#### Migrations

```sh
#
bin/console doctrine:migrations:list

#
bin/console doctrine:migrations:diff

#
bin/console doctrine:migrations:migrate -n
```

<!-- ## Library

```sh
#
composer require doctrine/orm

#
./vendor/bin/doctrine -h
``` -->

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h composer \
  --entrypoint /bin/bash \
  --name composer \
  docker.io/library/composer:2.1
```
