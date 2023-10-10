# Dokku

**Keywords:** PaaS

## Links

- [Code Repository](https://github.com/dokku/dokku)
- [Main Website](https://dokku.com)

## CLI

### Installation

#### Homebrew

```sh
brew tap dokku/repo
brew install dokku
```

### Usage

```sh
dokku -h
```

<!-- ## Delete App

```sh
dokku delete <app>
```

## Inspect Volume and App

```sh
docker inspect volume_data_{name_of_data_container}
docker inspect app_{name_of_app}_{some_randoms}
```

```sh
find /home/dokku/.volumes
```

# Issues

## Base table or view not found

```log
SQLSTATE[42S02]: Base table or view not found: 1146 Table 'dam._db_update' doesn't exist
```

```sh
dokku mariadb:console dam dam

CREATE TABLE _db_update (status varchar(255), name varchar(255));
exit

dokku manager:upgrade
``` -->
