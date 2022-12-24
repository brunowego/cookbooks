# libiconv

## Links

- [Main Website](https://gnu.org/software/libiconv/)

## Library

### Installation

#### Homebrew

```sh
brew install libiconv
```

<!--
export PATH="/usr/local/opt/libiconv/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libiconv/lib"
export CPPFLAGS="-I/usr/local/opt/libiconv/include"


export PKG_CONFIG_PATH="$(brew --cellar libxml2)/$(brew info --json libxml2 | jq -r '.[0].installed[0].version')/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L/usr/local/opt/libxml2/lib:$LDFLAGS"
-->

#### Unix-like

```sh
wget \
  -O - \
  'http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.tar.gz' | \
    tar -xz

( cd ./libiconv-1.13 && ./configure --prefix=/usr/local/Cellar/libiconv/1.13 && make && sudo make install ) && rm -r ./libiconv-1.13
```
