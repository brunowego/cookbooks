# cointop

## Links

- [Code Repository](https://github.com/cointop-sh/cointop)
- [Main Website](https://cointop.sh/)

## CLI

### Installation

#### Homebrew

```sh
brew install cointop
```

### Commands

```sh
cointop -h
```

### Configuration

```sh
#
mkdir -p ~/.config/cointop

#
cat << EOF > ~/.config/cointop/config.toml
currency = "USD"
default_view = ""
default_chart_range = "1Y"
api = "coingecko"
colorscheme = "cointop"
refresh_rate = 60
EOF
```

### Usage

```sh
#
cointop holdings
```
