# Database Markup Language (DBML)

**Keywords:** Database Modeling

## Links

- [Code Repository](https://github.com/holistics/dbml)
- [Main Website](https://dbml.org/)

## Related

- [dbdocs](/dbdocs.md)

## CLI

### Installation

```sh
# Using NPM
npm install @dbml/cli -g

# Using Yarn v1.x
yarn global add @dbml/cli
```

### Commands

```sh
#
dbml2sql -h
```

### Usage

```sh
#
dbml2sql ./schema.dbml \
  --postgres \
  -o ./schema.sql

#
dbml2sql ./schema.dbml \
  --mysql \
  -o ./schema.sql

#
dbml2sql ./schema.dbml \
  --mssql \
  -o ./schema.sql
```

## Tips

### Visual Studio Code

```sh
#
code --install-extension matt-meyers.vscode-dbml

#
jq '."recommendations" += ["matt-meyers.vscode-dbml"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```
