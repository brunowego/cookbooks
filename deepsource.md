# DeepSource

## Links

- [Main Website](https://deepsource.io/)

## CLI

### Links

- [Code Repository](https://github.com/deepsourcelabs/cli)
- [Docs](https://deepsource.io/docs/cli/usage/)

### Installation

#### Homebrew

```sh
brew tap deepsourcelabs/cli
brew install deepsource
```

### Commands

```sh
deepsource -h
```

### Usage

```sh
#
deepsource auth login
deepsource auth status

#
cat ~/.deepsource/config.toml

#
deepsource config generate
deepsource config validate

#
export DEEPSOURCE_DSN='https://[hash]@deepsource.io'

#
deepsource repo status
deepsource repo view

#
deepsource issues list
```

<!--
## Tips

###

```html
<a href="https://deepsource.io/gl/yo/devparty">
  <img src="https://deepsource.io/gl/yo/devparty.svg/?label=active+issues&show_trend=true&token=AxP-EMgofIoYWgzM4r1gOGtB" alt="DeepSource">
</a>
```
-->
