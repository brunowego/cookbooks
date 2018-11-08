# User

## Login

```sh
mysql -u [username] -p
```

### Remote

```sh
mysql -u [username] -p -h [hostname] -P 3306
```

## Create User

```sh
CREATE USER '[username]'@'%' IDENTIFIED BY '[password]';
```

## Add Privileges

```sh
GRANT ALL PRIVILEGES ON *.* TO '[username]'@'%';
```

```sh
FLUSH PRIVILEGES;
```

## Change User

```sh
ALTER USER '[username]'@'%' IDENTIFIED BY '[password]';
```

## Remove User

```sh
DROP USER '[username]'@'%';
```

## Show Users Info

```sh
SELECT User FROM mysql.user;
```

```sh
SHOW GRANTS [FOR '[username]'@'%'];
```

## Exit

```sh
quit;
```
