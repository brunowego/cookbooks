# dbdocs.io

## Links

- [Main Website](https://dbdocs.io)
- FAQ
  - [How to change email address?](https://dbdiagram.io/docs/faqs/change-email)

## Tools

- [dbdiagram.io](https://dbdiagram.io)
- [Database Markup Language (DBML)](./dbml.md)

## CLI

### Installation

```sh
# Using NPM
npm install dbdocs -g
```

### Commands

```sh
dbdocs --help
```

### Initialize

```sh
dbdocs login

#
dbdocs logout
```

### Usage

```sh
#
dbdocs ls

#
dbdocs validate ./schema.dbml

#
dbdocs build ./schema.dbml

#
dbdocs password \
  -p <name> \
  -s <password>

#
dbdocs remove <name>
```

### Issues

#### TBD

```log
✖ Failed: You have syntax error in schema.dbml line 269 column 40. Expected " ", comment, or newline but "-" found.
```

TODO
