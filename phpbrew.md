# PHPBrew

## Alternatives

- [phpenv](/phpenv.md)
- [asdf-php](/asdf/asdf-php.md)

## CLI

### References

- [CentOS Repo's](/centos.md#repositories)

### Dependencies

- [PHP](/php/README.md)
- [pkg-config](/pkg-config.md)
- [libxml2](/libxml2.md)
- [BZip2](/bzip2.md)
- [libzip](/libzip.md)
- [GNU Wget](/gnu-wget.md)
- [OpenSSL](/openssl.md)

<!--
- [GCC](/gcc.md)
- [GD Library](/gd.md)
- [OpenLDAP](/openldap.md)
-->

<!-- #### Homebrew

```sh
brew install \
  mhash \
  mcrypt \
  pcre \
  openssl@1.1
``` -->

<!-- #### APT

```sh
sudo apt update
sudo apt -y install \
  libssl-dev \
  libbz2-dev \
  libreadline-dev \
  libxslt1-dev \
  zlib1g-dev \
  libcurl3-dev \
  make
``` -->

<!-- #### Zypper

```sh
sudo zypper refresh
sudo zypper install -y \
  autoconf \
  gcc \
  openssl-devel \
  libcurl-devel \
  readline-devel \
  libxslt-devel \
  which
``` -->

<!-- #### YUM

```sh
yum check-update
sudo yum -y install \
  autoconf \
  gcc \
  openssl-devel \
  libcurl-devel \
  readline-devel \
  libxslt-devel \
  which \
  lbzip2

# Repo: Webtatic
sudo yum -y install libmcrypt-devel
``` -->

### Installation

#### Homebrew

```sh
brew install phpbrew
```

#### Binary

```sh
# Darwin
curl -L 'https://github.com/phpbrew/phpbrew/raw/master/phpbrew' -o /usr/local/bin/phpbrew && \
  chmod +x /usr/local/bin/phpbrew

# Linux
sudo curl -L 'https://github.com/phpbrew/phpbrew/raw/master/phpbrew' -o /usr/local/bin/phpbrew && \
  sudo chmod +x /usr/local/bin/phpbrew
```

### Initialize

```sh
phpbrew init
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# PHPBrew
source "$HOME/.phpbrew/bashrc"
```

```sh
sudo su - "$USER"
```

### Command

```sh
phpbrew help
```

### Downloader

- php_curl
- php_stream
- wget
- curl

More [downloader options](https://github.com/phpbrew/phpbrew/tree/master/src/PhpBrew/Downloader).

> Make sure the command is installed on the machine (`curl`, `wget`, etc.).

### Usage

```sh
# Versions List
phpbrew known \
  -u \
  --downloader=wget \
  --old

# Variants
phpbrew variants

# Define the version
export PHP_VERSION='[version]'

# Install
phpbrew -d install \
  --name="$PHP_VERSION-dev" \
  --downloader=wget \
  --stdout \
  "$PHP_VERSION" \
  +default +mysql

# Install with FPM
phpbrew -d install \
  --name="$PHP_VERSION-fpm-dev" \
  --downloader=wget \
  --stdout \
  "$PHP_VERSION" \
  +default +fpm +mysql

# Installed Versions
phpbrew list

# Switch Global
phpbrew switch "$PHP_VERSION"
# or, instance Only
phpbrew use "$PHP_VERSION"

# Extensions
phpbrew extension

## Options
phpbrew -d ext \
  --show-options \
  --show-path

## Commands
phpbrew -d ext install [extension]
phpbrew -d ext show [extension]
phpbrew -d ext enable [extension]
phpbrew -d ext disable [extension]
phpbrew -d ext clean --purge [extension]

# Like
phpbrew install "$PHP_VERSION" as "$PHP_VERSION"-dev like "$PHP_VERSION"-dev

# Clean
phpbrew clean -a "$PHP_VERSION"

# Purge
phpbrew switch-off
phpbrew purge "$PHP_VERSION"
```

### Tips

#### Proxy

```sh
phpbrew -d ext install \
  --downloader=wget \
  --http-proxy="$http_proxy" \
  --http-proxy-auth="$http_proxy_auth" \
  [extension]
```

### Issues

#### Missing Initialize

```sh
Exception: Can't store release json file
```

Missing run `phpbrew init`.

#### OpenSSL MacOS Issue

```log
ld: symbol(s) not found for architecture x86_64
make: *** [sapi/cli/php] Error 1
Error: Make failed: make: *** [sapi/cli/php] Error 1
```

```sh
phpbrew -d install \
  --no-patch \
  # ...
```

#### mbstring Error

```log
make: *** [ext/mbstring/libmbfl/filters/mbfilter_utf8_mobile.lo] Error 1
Error: Make failed: make: *** [ext/mbstring/libmbfl/filters/mbfilter_utf8_mobile.lo] Error 1
```

```sh
export CFLAGS='-Wno-implicit-function-declaration'
```

#### Missing pkg-config

```log
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.
```

Install [pkg-config](/pkg-config.md).

#### Missing Zip Library

```log
Warning:  PHP Startup: Invalid library (maybe not a PHP library) 'zip.so' in Unknown on line 0
```

Install [PHP Zip](/php-zip.md).

#### Missing SSL Library

```log
configure: error: Cannot find OpenSSL's <evp.h>
Error: Configure failed: configure: error: Cannot find OpenSSL's <evp.h>
```

Install `libssl-dev`.

#### Missing C Compiler

```log
configure: error: no acceptable C compiler found in $PATH
```

Install GCC.

#### Missing PEAR library

```log
Warning: file_get_contents(http://pecl.php.net/channel.xml): failed to open stream: HTTP request failed! in phar:///usr/local/bin/phpbrew/vendor/corneltek/pearx/src/PEARX/Core.php on line 35
PHP Warning:  file_get_contents(): SSL: Connection reset by peer in phar:///usr/local/bin/phpbrew/vendor/corneltek/pearx/src/PEARX/Core.php on line 35
```

```sh
git clone https://github.com/phpbrew/PEARX
( cd PEARX && onion bundle && sudo pear install -f ./package.xml )
```

<!-- ```sh
# GNU Wget
sudo wget -P /etc/ssl/certs http://curl.haxx.se/ca/cacert.pem

#
sudo sed -i 's|;\(openssl\.cafile=\)|\1/etc/ssl/certs/cacert.pem|g' "$(php -i | grep -oE /.+/php.ini)"
sudo sed -i 's|;\(openssl\.capath=\)|\1/etc/ssl/certs|g' "$(php -i | grep -oE /.+/php.ini)"

#
php -m | grep openssl

php -i | grep '^openssl$' -A 9
``` -->

<!-- ####

```log
PHP Fatal error:  Uncaught PharException: bz2 extension is required for bzip2 compressed .phar file "/usr/local/bin/phpbrew" in /usr/local/bin/phpbrew:10
```

TODO -->

#### Missing BZip2

```log
checking for BZip2 support... yes
checking for BZip2 in default path... not found
configure: error: Please reinstall the BZip2 distribution
Error: Configure failed: configure: error: Please reinstall the BZip2 distribution
```

Install [bzip2](/bzip2.md).

```sh
phpbrew -d install \
  [...] \
  # Homebrew
  +bz2="$(brew --prefix bzip2)"
  +bz2="$(brew --prefix bzip2)"
  # Linux
  +bz2="$(brew --prefix bzip2)"
```

#### Missing zlib

```log
checking for the location of zlib... configure: error: zip support requires ZLIB. Use --with-zlib-dir=<DIR> to specify prefix where ZLIB include and library are located
Error: Configure failed: checking for the location of zlib... configure: error: zip support requires ZLIB. Use --with-zlib-dir=<DIR> to specify prefix where ZLIB include and library are located
```

```sh
#
brew install zlib

#
phpbrew -d install \
  [...] \
  # Homebrew
  +zlib="$(brew --prefix zlib)"
```

#### Xcode Space

```log
/bin/sh: /Applications/Xcode: No such file or directory
make: *** [install-pear] Error 127
Error: Install failed: make: *** [install-pear] Error 127
```

Remove `Xcode X.X` (`XcodeX.X`) space in the app name.

#### Reentrancy

```log
make: *** [main/reentrancy.lo] Error 1
Error: Make failed: make: *** [main/reentrancy.lo] Error 1
```

```sh
sudo xcode-select -switch /Applications/Xcode\ 11.5.app

xcode-select -p
```

#### Missing OpenSSL

```log
make: *** [ext/openssl/openssl.lo] Error 1
Error: Make failed: make: *** [ext/openssl/openssl.lo] Error 1
```

```sh
# <= 5.5.x
phpbrew -d install \
  [...] \
  # Homebrew
  +openssl='/usr/local/opt/openssl'

# >= 5.6.x
phpbrew -d install \
  [...] \
  # Homebrew
  +openssl="$(brew --prefix openssl@1.1)"
  # Linux
  +openssl=shared
```

<!-- # Darwin
export PKG_CONFIG_PATH="$(brew --cellar openssl)/$(brew info --json openssl | jq -r '.[0].installed[0].version')/lib/pkgconfig:$PKG_CONFIG_PATH"
# Or
export PKG_CONFIG_PATH="/usr/local/Cellar/openssl/1.0.2t/lib/pkgconfig:$PKG_CONFIG_PATH" -->

#### Missing Oniguruma

```log
checking for oniguruma... no
configure: error: Package requirements (oniguruma) were not met:

No package 'oniguruma' found
```

```sh
# APT
sudo apt -y install libonig-dev
```

#### Missing libxml2

```log
configure: error: libxml2 not found. Please check your libxml2 installation.
```

Instal libxml2.

#### Missing GNOME XML library

```log
checking for libxml-2.0 >= 2.7.6... no
```

```sh
# Darwin
export PKG_CONFIG_PATH="$(brew --cellar libxml2)/$(brew info --json libxml2 | jq -r '.[0].installed[0].version')/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L/usr/local/opt/libxml2/lib:$LDFLAGS"

# Linux
# TODO
```

#### Missing cURL

```log
checking for cURL in default path... not found
configure: error: Please reinstall the libcurl distribution -
    easy.h should be in <curl-dir>/include/curl/
Error: Configure failed:     easy.h should be in <curl-dir>/include/curl/
```

```sh
phpbrew -d install \
  [...] \
  # Homebrew
  +curl="$(brew --prefix curl)"
```
