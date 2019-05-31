# User

## Login

```sh
mysql -u [username] -p
```

### Remote

```sh
mysql \
  -h [hostname] \
  -P 3306 \
  -u [username] \
  -p
```

## Create User

```sh
CREATE USER '[username]'@'%' IDENTIFIED BY '[password]';
```

## Add Privileges

```sql
GRANT ALL PRIVILEGES ON *.* TO '[username]'@'%';
```

```sql
FLUSH PRIVILEGES;
```

## Change User

```sql
ALTER USER '[username]'@'%' IDENTIFIED BY '[password]';
```

## Remove User

```sql
DROP USER '[username]'@'%';
```

## Show Users Info

```sql
SELECT User FROM mysql.user;
```

```sql
SHOW GRANTS [FOR '[username]'@'%'];
```

## Exit

```sql
quit;
```
