# Root

## Password

### Current

```sh
grep 'temporary password' /var/log/mysqld.log
```

### Change

```sh
mysql -ve 'SET PASSWORD = PASSWORD("[password]")' -u root -p --connect-expired-password
```

#### Issues

- ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
- ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.
