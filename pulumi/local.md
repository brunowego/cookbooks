# Pulumi CLI for LocalStack

**Keywords:** Wrapper

## Links

- [Code Repository](https://github.com/localstack/pulumi-local)

## Dependencies

- [LocalStack](/localstack/README.md)

## Installation

```sh
pip3 install -U pulumi-local
```

## Commands

```sh
pulumilocal help
```

## Usage

```sh
#
mkdir ./my-app && cd "$_"

#
pulumilocal new aws-typescript

#
pulumilocal stack ls
pulumilocal stack select dev

#
pulumilocal up
```
