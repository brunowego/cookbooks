# OS X

## Installation

### Homebrew

```sh
brew tap timescale/tap
brew install timescaledb
```

```sh
sed -i "s/^#shared_preload_libraries = ''/shared_preload_libraries = 'timescaledb'/" /usr/local/var/postgres/postgresql.conf
```

```sh
/usr/local/bin/timescaledb_move.sh
```

```sh
brew services restart postgresql
```

```sh
createuser postgres -s
```
