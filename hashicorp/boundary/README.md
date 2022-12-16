# HashiCorp Boundary

## Links

- [Code Repository](https://github.com/hashicorp/boundary)
- [Main Website](https://boundaryproject.io)
- [Developer](https://developer.hashicorp.com/boundary)
- [Docs](https://developer.hashicorp.com/boundary/docs)

## CLI

### Dependencies

- [Docker Community Edition (CE) Daemon](/docker/ce/daemon.md)

### Installation

#### Homebrew

```sh
brew tap hashicorp/tap
brew install boundary
```

### Commands

```sh
boundary -h
```

### Bootstrap

#### Develop Environment

```sh
#
boundary dev \
  -login-name 'admin' \
  -password 'Pa$$w0rd!'

#
echo -e '[INFO]\thttp://127.0.0.1:9200'
```

### Usage

```sh
#
boundary auth-methods list

#
export BOUNDARY_AUTH_METHOD_ID='ampw_1234567890'

#
boundary authenticate password -login-name admin

#
boundary accounts list

#
boundary auth-tokens list

#
boundary config get-token

#
boundary logout
```

## App

### Installation

#### Homebrew

```sh
brew tap hashicorp/tap
brew install hashicorp-boundary-desktop
```
