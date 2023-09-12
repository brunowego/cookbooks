# Database Markup Language (DBML)

**Keywords:** Database Modeling

## Links

- [Code Repository](https://github.com/holistics/dbml)
- [Main Website](https://dbml.dbdiagram.io)

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

<!--
--mysql
--mssql
-->

#### DBML to SQL

```sh
#
dbml2sql ./schema.dbml \
  --postgres \
  -o ./schema.sql
```

#### SQL to DBML

**Dependencies:** [Dump DDL](/postgresql/client.md#data-definition-language-ddl)

<!--  Remove "ALTER ..." -->

```sh
#
sql2dbml ./dump-ddl.sql --postgres
sql2dbml ./dump-ddl.sql --postgres > ./schema.dbml

#
cat ./schema.dbml
```

## Tips

### Visual Studio Code

```sh
#
code --install-extension matt-meyers.vscode-dbml

#
jq '."recommendations" += ["matt-meyers.vscode-dbml"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
