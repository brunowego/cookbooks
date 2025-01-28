# SQLFluff

**Keywords:** SQL Linting, SQL Formatting, SQL Style Guide

<!--
https://github.com/longradix/dblint
-->

## CLI

### Installation

```sh
# Using pip
pip install sqlfluff
```

### Commands

```sh
sqlfluff --help
```

### Configuration

**Refer:** `./.sqlfluff`

```
[sqlfluff]
large_file_skip_byte_limit = 0
```

### Usage

```sh
# Show supported dialects
sqlfluff dialects

# Lint SQL file
sqlfluff lint ./path/to/sql/file.sql --config ./.sqlfluff --dialect postgres --large_file_skip_byte_limit 0

# Fix SQL file
sqlfluff fix ./path/to/sql/file.sql --config ./.sqlfluff --dialect postgres
```
