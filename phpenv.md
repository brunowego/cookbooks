# phpenv

## CLI

### Dependencies

#### Homebrew

```sh
brew install \
  git \
  curl \
  pkg-config \
  bison@2.7 \
  re2c \
  icu4c \
  tidy-html5 \
  libzip \
  libxml2 \
  libmcrypt
```

<!-- #### YUM

```sh
yum check-update

sudo yum -y install \
  bison \
  bzip2 \
  curl \
  gcc-c++ \
  git \
  gzip \
  libffi-devel \
  libxml2-devel \
  make \
  openssl-devel \
  readline-devel \
  sqlite-devel \
  tar \
  zlib-devel \
  curl-devel
``` -->

<!-- #### APT

```sh
sudo apt update

sudo apt -y install \
  curl \
  g++ \
  git \
  gzip \
  libbison-dev \
  libbz2-dev \
  libcurl4-openssl-dev \
  libffi-dev \
  libjpeg-dev \
  libpng++-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libtidy-dev \
  libxml2-dev \
  libxslt1-dev \
  libzip-dev \
  make \
  re2c \
  tar \
  zlib1g-dev
``` -->

<!-- #### Zypper

```sh
sudo zypper refresh

sudo zypper install -y \
  curl \
  gcc-c++ \
  git-core \
  gzip \
  libbz2-devel \
  libffi-devel \
  libopenssl-devel \
  make \
  readline-devel \
  sqlite3-devel \
  tar \
  zlib-devel
``` -->

### Installation

#### Unix-like

```sh
git clone \
  -c http.sslVerify=false \
  'https://github.com/phpenv/phpenv' ~/.phpenv
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# phpenv
export PHPENV_ROOT="$HOME/.phpenv"
export PATH="$PHPENV_ROOT/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### php-build

```sh
git clone \
  -c http.sslVerify=false \
  'https://github.com/php-build/php-build' $(phpenv root)/plugins/php-build
```

### Commands

```sh
phpenv help
```

### Usage

```sh
# List Versions
phpenv install -l

# Installation
phpenv install [version]

#
phpenv rehash

#
phpenv versions

#
phpenv global [version]

#
eval "$(phpenv init -)"
```

### Tips

#### Debug Mode

```sh
PHP_BUILD_DEBUG=1 \
  phpenv install [version]
```

### Issues

#### OpenSSL

```log
configure: error: Cannot find OpenSSL'\''s <evp.h>'
```

```sh
# Homebrew
brew install openssl@1.1

PHP_BUILD_CONFIGURE_OPTS=" \
  --with-openssl=$(brew --prefix openssl) \
" \
  phpenv install [version]
```

#### zlib

```log
configure: error: Cannot find zlib
```

```sh
# Homebrew
brew install zlib

PHP_BUILD_CONFIGURE_OPTS=" \
  --with-zlib-dir=$(brew --prefix zlib) \
" \
  phpenv install [version]
```

#### Bzip2

```log
configure: error: Please reinstall the BZip2 distribution
```

```sh
# Homebrew
brew install bzip2

PHP_BUILD_CONFIGURE_OPTS=" \
  --with-bz2=$(brew --prefix bzip2) \
" \
  phpenv install [version]
```

#### libjpeg/libpng

```log
configure: error: jpeglib.h not found.
configure: error: pnglib.h not found.
```

```sh
# Homebrew
brew install libjpeg libpng

PHP_BUILD_CONFIGURE_OPTS=" \
  --with-jpeg-dir=$(brew --prefix libjpeg) \
  --with-png-dir=$(brew --prefix libpng) \
" \
  phpenv install [version]
```

#### iconv

```log
configure: error: Please specify the install prefix of iconv with --with-iconv=<DIR>
```

```sh
# Homebrew
brew install libiconv

PHP_BUILD_CONFIGURE_OPTS=" \
  --with-iconv=$(brew --prefix libiconv) \
" \
  phpenv install [version]
```

#### iconv

```log
configure: error: Please reinstall libedit - I cannot find readline.h
```

```sh
# Homebrew
brew install libedit readline

PHP_BUILD_CONFIGURE_OPTS=" \
  --with-libedit=$(brew --prefix libedit) \
" \
  phpenv install [version]
```

### Uninstall

```sh
rm -fR ~/.phpenv
```
