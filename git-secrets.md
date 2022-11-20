# git-secrets

**Keywords:** Secrets Detection, SAST

## Links

- [Code Repository](https://github.com/awslabs/git-secrets)

## CLI

### Installation

#### Homebrew

```sh
brew install git-secrets
```

### Commands

```sh
git secrets -h
```

### Usage

```sh
#
git secrets --scan [-r|--recursive] [--cached] [--no-index] [--untracked] [<files>...]

#
git secrets --scan-history

#
git secrets --install [-f|--force] [<target-directory>]

#
git secrets --list [--global]

#
git secrets --add [-a|--allowed] [-l|--literal] [--global] <pattern>

#
git secrets --add-provider [--global] <command> [arguments...]

#
git secrets --register-aws [--global]

#
git secrets --aws-provider [<credentials-file>]
```
