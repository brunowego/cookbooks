# dbt Core

## Links

- [Code Repository](https://github.com/dbt-labs/dbt-core)

## CLI

### Links

- [Docs](https://docs.getdbt.com/docs/core/about-the-cli)

### Installation

```sh
# Using pip
pipx install dbt-core
# Or, for postgres
pipx install dbt-postgres --include-deps
# Or, for snowflake
pipx install dbt-snowflake --include-deps

# Using Homebrew
brew tap dbt-labs/dbt
brew install dbt
# Or, for postgres
brew install dbt-postgres
# Or, for snowflake
brew install dbt-snowflake
```

<!--
https://docs.getdbt.com/docs/core/installation-overview#install-dbt-core
-->

### Commands

```sh
dbt -h
```

### Usage

```sh
#
dbt init <name>

#
dbt run
```
