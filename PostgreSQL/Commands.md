# Commands

## User

### Create

```sh
sudo -u $USER createuser --interactive
```

### Drop

```sh
sudo -u $USER dropuser [name]
```

## Database

### Create

```sh
sudo -u $USER createdb [database]
```

### Drop

```sh
sudo -u $USER dropdb [database]
```

## Command

```sh
sudo -u $USER psql -c '[command]'
```

##

```sh
sudo -u $USER psql <<-EOSQL
[sql]
EOSQL
```
