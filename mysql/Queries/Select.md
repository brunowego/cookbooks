# Select

## Select by domain and distinct

```sql
SELECT DISTINCT (SUBSTR(email, INSTR(email, '@') + 1, LENGTH(email) - (INSTR(email, '@') + 1) - LENGTH(SUBSTRING_INDEX(email,'.',-1)))) FROM table_name GROUP BY email
```

## Select by domain with @

```sql
SELECT SUBSTR(email, INSTR(email, '@'), INSTR(email, '.')) FROM table_name
```

## Select the 15 more domain existing in list

```sql
SELECT SUBSTRING_INDEX(email, '@', -1) as Domain, count(*) as Total FROM table_name GROUP BY Domain ORDER BY Total DESC LIMIT 15
```

## Select id, account and domain from email

```sql
SELECT id, SUBSTRING(email FROM 1 FOR POSITION('@' IN email)-1) AS account, SUBSTRING(email FROM POSITION('@' IN email)+1) AS domain FROM table_name ORDER BY id
```

## Update from domain email

```sql
UPDATE table_name AS u INNER JOIN table_name AS us ON u.id = us.id SET u.username = (SELECT SUBSTRING(us.email FROM 1 FOR POSITION('@' IN us.email)-1) AS new_username)
```
