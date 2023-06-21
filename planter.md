# planter

## Links

- [Code Repository](https://github.com/achiku/planter)

## CLI

### Installation

```sh
GOBIN=/usr/local/bin go install github.com/achiku/planter@latest
```

### Commands

```sh
planter --help
```

### Usage

```sh
#
export POSTGRES_HOST='127.0.0.1'
export POSTGRES_PORT='5432'
export POSTGRES_USER='dev'
export POSTGRES_PASSWORD='dev'
export POSTGRES_DB=''

export DATABASE_URL="postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?sslmode=disable"

#
planter -s public "$DATABASE_URL" -o "./${POSTGRES_DB}.uml"

#
java -jar ./plantuml.jar -verbose "./${POSTGRES_DB}.uml"
```
