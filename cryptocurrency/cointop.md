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
default_view = "default"
default_chart_range = "1Y"
api = "coingecko"
colorscheme = "cointop"
refresh_rate = 15
EOF
```

### Usage

```sh
#
cointop

#
cointop dominance

#
cointop holdings

#
cointop price -c btc,eth,bnb,xrp,ada
```

### Shortcut

- [Favorites](https://github.com/cointop-sh/cointop/blob/master/docs/content/favorites.md)

### Tips

#### Server

```sh
#
ssh-keygen

#
cointop server -p 2222
```

<!-- #### Autocomplete

```sh
# cointop
source <(cointop completion zsh)
``` -->
