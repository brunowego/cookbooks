# Update

## Replace

```sql
UPDATE table_name SET column_name = REPLACE(column_name, 'find string', 'to string');
```

## Multiple update

```sql
SELECT * FROM table WHERE id IN (1,2,3,...)
```

## Reset primary key

```sql
SET @temp = 0;
UPDATE table_name SET column_name = @temp := (@temp +1);
```

## Remove anything (email example)

## Before

```sql
SELECT SUBSTRING(email, INSTR(email, '@') +1) FROM table_name UPDATE table_name SET column_name = SUBSTRING(email, INSTR(email, '@') +1)
```

## After

```sql
SELECT SUBSTRING_INDEX(email, '@', 1) FROM table_name UPDATE table_name SET email = SUBSTRING_INDEX(email, '@', 1)
```
