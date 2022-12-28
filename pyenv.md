# Simple Python Version Management (pyenv)

## CLI

### Dependencies

- [zlib](/zlib.md)

<!-- #### Homebrew

```sh
# macOS Mojave before
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.*.pkg -target /

brew install \
  autoconf \
  pkg-config \
  openssl \
  readline \
  bzip2
``` -->

<!-- #### APT

```sh
sudo apt update
sudo apt -y install git curl tar gzip make g++ libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
``` -->

<!-- #### YUM

```sh
yum check-update
sudo yum -y install git curl tar gzip make gcc-c++ libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
``` -->

<!-- #### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core curl tar gzip make gcc-c++ libffi-devel libopenssl-devel libbz2-devel readline-devel sqlite3-devel
``` -->

### Installation

#### Unix-like

##### Using Git

```sh
git clone 'https://github.com/pyenv/pyenv.git' ~/.pyenv
```

##### Using Tarball

```sh
# Direct install
mkdir -p ~/.pyenv && \
  curl -L "$(curl -ks https://api.github.com/repos/pyenv/pyenv/releases/latest | grep tarball_url | cut -d '"' -f 4)" | \
    tar -xzC ~/.pyenv --strip-components 1

# Install Remote
curl -L "$(curl -ks https://api.github.com/repos/pyenv/pyenv/releases/latest | grep tarball_url | cut -d '"' -f 4)"

tar -xzC ~/.pyenv --strip-components 1

mkdir -p ~/.pyenv
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
```

```sh
sudo su - "$USER"
```

### Configuration

```sh
# Git ignore
echo '/.python-version' >> ~/.gitignore_global
```

### Update

```sh
( cd ~/.pyenv/plugins/python-build/../.. && git pull )
```

### Commands

```sh
pyenv help
```

### Bootstrap

```sh
# Install
pyenv install --list

# Installation
pyenv install <version>

# Versions
pyenv versions

# Set
pyenv local <version>
pyenv global <version>

#
pyenv uninstall -f <version>
```

### Tips

#### Install From Cache

```sh
wget \
  -P ~/.pyenv/cache \
  https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tar.xz

pyenv install 3.8.0

rm ~/.pyenv/cache/*.tar.xz
```

### Issues

<!-- ####

```sh
# Darwin
PYTHON_CONFIGURE_OPTS='--with-system-expat' \
  CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" \
  LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib" \
  pyenv install <version>
``` -->

#### Missing bzip2

```log
WARNING: The Python bz2 extension was not compiled. Missing the bzip2 lib?
```

```sh
CFLAGS="$CFLAGS -I$(brew --prefix bzip2)/include" \
  LDFLAGS="$LDFLAGS -L$(brew --prefix bzip2)/lib" \
    pyenv install <version>
```

#### Missing zlib

```log
ERROR: The Python zlib extension was not compiled. Missing the zlib?
```

```sh
CFLAGS="$CFLAGS -I$(brew --prefix zlib)/include" \
  LDFLAGS="$LDFLAGS -L$(brew --prefix zlib)/lib" \
    pyenv install <version>
```

#### Big Sur Issue

```log
Last 10 log lines:
./Modules/posixmodule.c:8210:15: error: implicit declaration of function 'sendfile' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        ret = sendfile(in, out, offset, &sbytes, &sf, flags);
              ^
./Modules/posixmodule.c:10432:5: warning: code will never be executed [-Wunreachable-code]
    Py_FatalError("abort() called from Python code didn't abort!");
    ^~~~~~~~~~~~~
1 warning and 1 error generated.
make: *** [Modules/posixmodule.o] Error 1
make: *** Waiting for unfinished jobs....
1 warning generated.
```

```sh
pyenv install \
  --patch \
  <version> \
  < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch)
```

### Uninstall

```sh
rm -fR ~/.pyenv
```
