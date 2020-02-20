# migrate

## CLI

### Installation

#### Homebrew

```sh
brew install golang-migrate
```

#### Darwin

```sh
curl -L "https://github.com/golang-migrate/migrate/releases/download/$(curl -s https://api.github.com/repos/golang-migrate/migrate/releases/latest | grep tag_name | cut -d '"' -f 4)/migrate.darwin-amd64.tar.gz" | tar -xzC /usr/local/bin --transform s/migrate.darwin-amd64/migrate/
```

### Commands

```sh
migrate -help
```
