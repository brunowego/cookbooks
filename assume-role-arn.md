# assume-role-arn

## Links

- [Code Repository](https://github.com/nordcloud/assume-role-arn)

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/nordcloud/assume-role-arn/releases/download/v0.3.9/assume-role-arn-osx' \
  -o /usr/local/bin/assume-role-arn && \
    chmod +x /usr/local/bin/assume-role-arn
```

#### Linux Binary

```sh
curl \
  -L 'https://github.com/nordcloud/assume-role-arn/releases/download/v0.3.9/assume-role-arn-linux' \
  -o /usr/local/bin/assume-role-arn && \
    chmod +x /usr/local/bin/assume-role-arn
```

### Commands

```sh
assume-role-arn -h
```

### Usage

```sh
#
eval $(assume-role-arn -r [role_arn])

aws sts get-caller-identity

#
assume-role-arn \
  -r [role_arn] \
    aws sts get-caller-identity
```
