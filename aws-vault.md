# AWS Vault

**Keywords:** AWS Profile Switcher

## Links

- [Code Repository](https://github.com/99designs/aws-vault)

## CLI

### Installation

#### Homebrew

```sh
brew install --cask aws-vault
```

### Commands

```sh
aws-vault --help
```

### Usage

```sh
#
aws-vault add [name]

#
aws-vault exec [name] -- aws s3 ls

#
aws-vault login [name]

#
aws-vault list
```
