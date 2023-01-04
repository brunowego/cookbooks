# dbdocs.io

## Links

- [Main Website](https://dbdocs.io/)

## Tools

- [dbdiagram.io](https://dbdiagram.io)
- [Database Markup Language (DBML)](./dbml.md)

## CLI

### Installation

```sh
# Using NPM
npm install -g dbdocs

# Using Yarn
yarn global add dbdocs
```

### Commands

```sh
dbdocs --help
```

### Initialize

```sh
dbdocs login
```

### Usage

```sh
#
dbdocs ls

#
dbdocs build ./<filename>.dbml

#
dbdocs password \
  -p <name> \
  -s <password>

#
dbdocs validate ./<filename>.dbml

#
dbdocs remove <name>
```
