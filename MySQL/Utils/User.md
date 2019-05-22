# User

## Create

```sh
mysql -u root -p -ve 'CREATE USER "[username]"@"%" IDENTIFIED BY "[password]"'
```

### Issues

- Host '0.0.0.0' is not allowed to connect to this MySQL server"

## Grant

```sh
mysql -u root -p -ve "GRANT ALL PRIVILEGES ON *.* TO '[username]'@'%'"
mysql -u root -p -ve 'FLUSH PRIVILEGES'
```

## Password

### Validation

```sql
UNINSTALL PLUGIN validate_password;
```

#### Issues

- ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
