# aws-google-auth

## CLI

### Installation

#### Homebrew

```sh
brew install aws-google-auth
```

### Commands

```sh
aws-google-auth -h
```

### Usage

```sh
#
aws-google-auth \
  -u <username> \
  -I <idp-id> \
  -S <sp-id> \
  -R us-east-1 \
  -d 43200 \
  -p dev \
  --save-failure-html

#
cat ~/.aws/config
cat ~/.aws/credentials
```
