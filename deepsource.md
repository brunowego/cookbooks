# DeepSource

## Links

- [Main Website](https://deepsource.io/)

## CLI

### Links

- [Code Repository](https://github.com/deepsourcelabs/cli)
- [Docs](https://deepsource.io/docs/cli/usage/)

### Docs

- [Analyzers](https://deepsource.io/docs/concepts/#analyzers)

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

### Authenticate

```sh
#
deepsource auth login

#
deepsource auth status

#
deepsource auth refresh
```

#### Configuration File

```sh
#
cat ~/.deepsource/config.toml
```

### Usage

```sh
#
deepsource config generate

#
deepsource config validate

#
deepsource repo status

#
deepsource repo view

#
deepsource issues list
```

## Tips

<!-- ### Close Issues

```sh
# close, closes, closed, fix, fixes, fixed, resolve, resolves, resolved
git commit -m "[YOUR COMMIT MESSAGE]; closes #1, closes #2, closes #3"
``` -->

### Reporting

1. Repository -> Settings
2. Reporting -> Data Source Name (DSN) -> Copy

```sh
#
echo 'DEEPSOURCE_DSN=[secret]' >> ./.env

#
direnv allow ./

# Keys: go, python, ruby
deepsource report \
  --analyzer test-coverage \
  --key javascript \
  --value-file ./coverage.xml
```

<!-- ###

```html
<a href="https://deepsource.io/gl/yo/devparty">
  <img src="https://deepsource.io/gl/yo/devparty.svg/?label=active+issues&show_trend=true&token=AxP-EMgofIoYWgzM4r1gOGtB" alt="DeepSource">
</a>
``` -->
