# dbt Core

<!--
https://github.com/brooklyn-data/dbtenv
-->

## Links

- [Code Repository](https://github.com/dbt-labs/dbt-core)

## CLI

### Links

- [Docs](https://docs.getdbt.com/docs/core/about-the-cli)

### Installation

```sh
# Using pip (Recommended)
pipx install dbt-core
# Or, for postgres
pipx install dbt-postgres --include-deps
# Or, for snowflake
pipx install dbt-snowflake --include-deps

# Using Homebrew
# brew tap dbt-labs/dbt
# brew install dbt
# Or, for postgres
# brew install dbt-postgres
# Or, for snowflake
# brew install dbt-snowflake
```

<!--
https://docs.getdbt.com/docs/core/installation-overview#install-dbt-core
-->

### Commands

```sh
dbt -h
```

### Configuration

```sh
dbt --version

cat << EOF > ~/.dbt/snowflake_key.p8
<private-key>
EOF

cat << EOF > ~/.dbt/profile.yml
---
default:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <account-name>
      user: <username>
      private_key_path: <private-key-path>
      role: <role>
      database: <database>
      warehouse: <warehouse>
      schema: <schema>
      threads: 4
EOF
```

```sh
dbt deps
dbt debug
```

### Usage

```sh
#
# dbt init <name>

#
# dbt run

#
dbt show --inline '<query>' --limit 20
```

### Issues

#### TBD

```log
17:09:24  Encountered an error:
Database Error
  Unable to load PEM file. See https://cryptography.io/en/latest/faq/#why-can-t-i-import-my-pem-file for more details. InvalidData(InvalidByte(0, 92))
```

TODO
