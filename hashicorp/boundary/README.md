# HashiCorp Boundary

<!--
https://github.com/janikgar/boundary-chart
-->

**Keywords:** Bastion Host, IAP, Access Plane

## Links

- [Code Repository](https://github.com/hashicorp/boundary)
- [Main Website](https://boundaryproject.io)
- [Developer](https://developer.hashicorp.com/boundary)
- [Docs](https://developer.hashicorp.com/boundary/docs)

## CLI

## Dependencies

- Optional: [direnv](/direnv.md)

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

# Create your organization
echo -e '[INFO]\thttp://127.0.0.1:9200/scopes/global/scopes/new'
```

### Usage

```sh
#
boundary auth-methods list

#
echo 'BOUNDARY_AUTH_METHOD_ID=ampw_1234567890' >> ./.env

direnv allow ./

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
