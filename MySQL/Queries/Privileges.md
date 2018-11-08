# Privileges

## Grant

```sql
GRANT ALL PRIVILEGES ON '[db-name]'.* TO '[username]'@'%';
```

## Show

```sql
SHOW GRANTS;
SHOW GRANTS FOR CURRENT_USER;
SHOW GRANTS FOR CURRENT_USER();
```

```sql
SHOW GRANTS FOR '[username]'@'%';
```

## Flush

```sql
FLUSH PRIVILEGES;
```
