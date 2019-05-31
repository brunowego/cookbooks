# OS X

## Installation

### Homebrew

```sh
brew install postgres
```

## Initialize

### Homebrew

```sh
initdb /usr/local/var/postgres
```

## Configuration

### Homebrew

```sh
sed -i 's/^#listen_addresses =/listen_addresses =/' /usr/local/var/postgres/postgresql.conf
```

## Service

### Homebrew

```sh
brew services start postgres
```
