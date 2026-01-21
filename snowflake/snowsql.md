# SnowSQL

## Links

- Docs
  [SnowSQL (CLI client)](https://docs.snowflake.com/en/user-guide/snowsql)

## Installation

```sh
# Using Homebrew
brew install --cask snowflake-snowsql
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshenv`:

```sh
# SnowSQL
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
```

```sh
source ~/.zshrc
```

## Commands

```sh
snowsql --help
```

## Configuration

```sh
#
export SNOWSQL_ACCOUNT='<account-name>'
export SNOWSQL_USER='<username>'

snowsql -P

# Or
snowsql \
  -a <account-name> \
  -u <username> \
  -P
#

#
cat ~/.snowsql/config
```

## Queries

```sql
-- Show current version
SELECT CURRENT_VERSION();

-- Show current user
SELECT CURRENT_USER();

-- Show current role
SELECT CURRENT_ROLE();

-- Show current warehouse
SELECT CURRENT_WAREHOUSE();

-- Show current database
SELECT CURRENT_DATABASE();
```

## Tips

### Get Account Name

1. [Dashboard](https://app.snowflake.com)
2. Admin -> Accounts
3. Select Account -> More -> Edit account name -> Manage URLs -> Current URL
   - Something like `https://<account_name>.snowflakecomputing.com`

### Queries

#### Database

```sql
SHOW DATABASES;

-- e.g. baseball
CREATE DATABASE <db-name>;

USE DATABASE <db-name>;

SHOW SCHEMAS;
```

#### Stages

```sql
-- e.g. baseball_game_stats
CREATE OR REPLACE STAGE <stage-name> FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);

-- e.g. baseball_game_stats
PUT file://absolute/path/to/<filename>.csv @<stage-name>;

SHOW STAGES IN DATABASE <db-name>;
```

#### Tables

```sql
CREATE TABLE <table-name> (
    -- ...
);

--
COPY INTO <table-name> FROM @<stage-name> FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);

SELECT * FROM <table-name> LIMIT 20;
```
