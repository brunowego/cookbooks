# Pipe Viewer (pv)

## Installation

```sh
# Using Homebrew
brew install pv

# Using YUM
yum check-update
sudo yum -y install pv
```

## Commands

```sh
pv -h
```

## Usage

```sh
# MySQL
pv </path/to/dump.sql> | \
  mysql \
    -h 127.0.0.1 \
    -P 3306 \
    -u <username> \
    -p'<password>' \
    <database>

# PostgreSQL
export DATABASE_URL=''

pv </path/to/dump.sql> | psql -d "$DATABASE_URL"
# Or, to suppress output
pv </path/to/dump.sql> | psql -d "$DATABASE_URL" >/dev/null 2>&1
```
