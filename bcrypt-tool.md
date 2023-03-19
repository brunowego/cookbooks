# bcrypt-tool

## Links

- [Code Repository](https://github.com/shoenig/bcrypt-tool)

## CLI

### Installation

#### go install

```sh
GOBIN=/usr/local/bin go install github.com/shoenig/bcrypt-tool@latest
```

### Commands

```sh
bcrypt-tool -h
```

### Usage

```sh
#
bcrypt-tool hash 'Pa$$w0rd!'
bcrypt-tool hash 'Pa$$w0rd!' 12

#
bcrypt-tool match 'Pa$$w0rd!' '$2a$10$6jPci9cL3AIC/3ZTGs1hHu6eaMJaySzw88itevSUzLyn8n3ap7IqC'

#
bcrypt-tool cost $(bcrypt-tool hash 'Pa$$w0rd!')
```
