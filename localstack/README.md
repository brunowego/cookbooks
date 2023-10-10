# LocalStack

**Keywords:** Cloud Service Emulator

## Links

- [Code Repository](https://github.com/localstack/localstack)
- [Main Website](https://localstack.cloud)

## CLI

### Dependencies

- [AWS CLI](/aws/README.md#cli)
- [Docker CE (Daemon)](/docker/docker-ce.md#daemon)

### Installation

#### Homebrew

```sh
brew install localstack
```

### Commands

```sh
localstack -h
```

### Configuration

```sh
#
localstack auth login -u <username>

#
localstack config show
```

### Usage

```sh
#
export DEBUG=1

# With detach
localstack start -d

#
localstack status
localstack status services

#
localstack logs

#
localstack ssh

#
localstack update all

#
localstack stop
```

<!--
localstack extensions list
localstack wait
-->

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# LocalStack
source <(localstack completion zsh) # bash
```

```sh
source ~/.zshrc
```

#### AWS Configuration

```sh
# HTTPie
http :4566/health

#
export AWS_ENDPOINT_URL=http://127.0.0.1:4566
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-west-2

#
aws s3 ls

#
localstack status services
```

<!--
aws configure --profile localstack
-->
