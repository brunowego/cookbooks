# Deployer

<!--
https://stefanzweifel.io/posts/2021/05/24/deployer-on-github-actions
-->

**Keywords:** Tool for PHP

## Links

- [Code Repository](https://github.com/deployphp/deployer)
- [Main Website](https://deployer.org/)

## CLI

### Installation

#### Homebrew

```sh
brew install deployer
```

#### Unix-like

```sh
# GNU Wget
wget -O /usr/local/bin/dep 'https://deployer.org/deployer.phar' && \
  chmod +x /usr/local/bin/dep

# cURL
curl -L 'https://deployer.org/deployer.phar' -o /usr/local/bin/dep && \
  chmod +x /usr/local/bin/dep
```

### Commands

```sh
#
dep help
```

### Usage

```sh
#
dep list
```
