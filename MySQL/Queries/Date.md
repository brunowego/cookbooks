# Date

## Invert date format

```sql
UPDATE table_name SET column_name = DATE_FORMAT(STR_TO_DATE(column_name, '%d/%m/%Y'), '%Y-%m-%d');
```

## Where

### Between

```sql
SELECT * FROM table_name WHERE column_name BETWEEN ‘2010-11-11’ AND ‘2010-11-30’
```

### Simple compare

```sql
SELECT * FROM table_name WHERE YEAR(column_name) = ‘2010’
```

### Having

```sql
SELECT * FROM table_name HAVING column_name > CURDATE()
```
