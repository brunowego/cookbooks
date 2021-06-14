# jwt-cli

## Installation

### Homebrew

```sh
brew tap mike-engel/jwt-cli
brew install jwt-cli
```

### Linux Binary

```sh
curl -L "https://github.com/mike-engel/jwt-cli/releases/download/$(curl -s https://api.github.com/repos/mike-engel/jwt-cli/releases/latest | grep tag_name | cut -d '"' -f 4)/jwt-linux.tar.gz" | \
  tar -xzC /usr/local/bin
```

### Commands

```sh
jwt help
```

### Usage

```sh
#
jwt encode \
  --secret fake \
  '{"hello":"world"}' | \
  jwt decode -

#
curl '<auth-api>' | \
  jq -r '.access_token' | \
    jwt decode -
```
