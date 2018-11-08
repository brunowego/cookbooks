# Data Types

## Numeric Types

- `TINYINT`: 1-byte signed integer, from -128 to 127
- `SMALLINT`: 2-byte signed integer, from -32,768 to 32,767
- `INT`: 4-byte signed integer, from -2,147,483,648 to 2,147,483,647
- `BIGINT`: 8-byte signed integer, from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
- `FLOAT`: 4-byte single precision floating point number
- `DOUBLE`: 8-byte double precision floating point number
- `DECIMAL`: Hive 0.13.0 introduced user definable precision and scale

## String Types

- `STRING`
- `VARCHAR`
- `CHAR`

## Date/Time Types

- `TIMESTAMP`
- `DATE`

## Misc Types

- `BOOLEAN`
- `BINARY`

## Complex Data Types

- arrays: `ARRAY<data_type>`
- maps: `MAP<primitive_type, data_type>`
- structs: `STRUCT<col_name: data_type [COMMENT col_comment], …>`

## Aggregation Functions

```sql
count(*), count(expr), count(DISTINCT, expr)
sum(col), sum(DISTINCT, col)
avg(col), avg(DISTINCT, col)
min(col), max(col)
```
