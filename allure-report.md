# Allure Report

## Links

- [Code Repository](https://github.com/allure-framework/allure2)

## CLI

### Installation

#### Homebrew

```sh
brew install allure
```

### Commands

```sh
allure --help
```

### Usage

```sh
#
pip3 install -U allure-pytest

#
pytest \
  -s \
  -q \
  --alluredir=./result

#
allure serve ./result

#
allure generate ./result \
  -o ./report \
  --clean

#
allure open \
  -h 127.0.0.1 \
  -p 8883 \
  ./report
```
