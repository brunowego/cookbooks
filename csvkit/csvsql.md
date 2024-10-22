# csvsql

<!--
https://gist.github.com/swayson/6aa54c9d7f01190292c0
-->

**Keywords:** Import CSV to SQL

## Learn

- [Generate Schema and Import CSV into SQL Databases from the Terminal](https://mupati.medium.com/generate-schema-and-import-csv-into-sql-databases-from-the-terminal-2d59d2068c55)

## CLI

### Dependencies

```sh
# For PostgreSQL
"$(brew --prefix csvkit)"/libexec/bin/python3 -m pip install psycopg2
```

### Commands

```sh
csvsql -h
```

### Usage

```sh
# To PostgreSQL
export DATABASE_URL=''

csvsql \
  --db "$DATABASE_URL" \
  --insert \
  --tables <table_name> \
  </path/to/filename>.csv
```

<!--
csvsql --query "SELECT * FROM arquivo.csv WHERE coluna = 'valor'" arquivo.csv
-->

### Tips

#### TBD

```sh
#
csvsql \
  --db "$DATABASE_URL" \
  --query "INSERT INTO my_table (id, full_name, age_years, location_city) SELECT gen_random_uuid(), name, age, city FROM </path/to/filename>.csv" \
  </path/to/filename>.csv
```
