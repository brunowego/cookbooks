# User

## Create

```sh
mysql -ve 'CREATE USER "[username]"@"%" IDENTIFIED BY "[password]"' -u root -p
```

### Issues

- Host '0.0.0.0' is not allowed to connect to this MySQL server"

## Grant

```sh
mysql -ve 'GRANT ALL PRIVILEGES ON *.* TO "[username]"@"%"' -u root -p
mysql -ve 'FLUSH PRIVILEGES' -u root -p
```

## Password

### Validation

```sql
UNINSTALL PLUGIN validate_password;
```

#### Issues

- ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
