# Local Client

1. Edit Connection
2. Local Client:
3. Add Home
4. Copy MySQL Path

## Tips

### OS X

- Finder - Go to Folder: `Command` + `Shift` + `G`

## Client

### MySQL

```sh
echo $(dirname $(which mysqldump))
```

### PostgreSQL

```sh
echo $(dirname $(which pg_dump))
```
