# Homebrew

<!--
which wrk || brew install wrk
-->

## CLI

### Installation

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Commands

```sh
brew help
```

### Configuration

```sh
#
brew analytics
brew analytics off
```

### Usage

```sh
# List installed
brew leaves

# Prefix path
brew --prefix <package>

# Cellar path
brew --cellar <package>

# Versions
brew list --versions <package>

# Switch
brew switch <formula> <version>

# Dependencies
brew deps \
  --tree \
  --installed
```

### Self Update

```sh
cd "$(brew --repo)" && git fetch && git reset --hard origin/master && brew update
```

### Tips

#### List Formula Installed Files

```sh
brew list <formula>
```

#### Remove All

```sh
brew leaves | xargs brew uninstall
```

#### Clean Cache

```sh
# List Cache
ls $(brew --cache)

# Clean Up
brew cleanup -s

rm -fR $(brew --cache)
```

#### Developer Mode

```sh
#
brew developer state

#
brew developer off
```

#### Command-line completion

```sh
# Using Antigen
antigen bundle brew

# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 brew\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

### Issues

#### Missing Directory

```log
Error: /usr/local/Cellar/php/8.0.13_1 is not a directory
```

```sh
mkdir /usr/local/Cellar/php/8.0.13_1
```

#### sbin Path

```log
Warning: Homebrew's "sbin" was not found in your PATH but you have installed
formulae that put executables in /usr/local/sbin.
Consider setting your PATH for example like so:
  echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.zshrc
```

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Homebrew Fix
export PATH="/usr/local/sbin:$PATH"
```

#### cURL RC

```log
curl: (60) SSL certificate problem: self signed certificate in certificate chain
More details here: https://curl.haxx.se/docs/sslcerts.html

curl failed to verify the legitimacy of the server and therefore could not
establish a secure connection to it. To learn more about this situation and
how to fix it, please visit the web page mentioned above.
```

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Homebrew
export HOMEBREW_CURLRC='1'
```

```sh
sudo su - "$USER"
```

#### Ignore SSL

```log
# fatal: unable to access 'https://github.com/Homebrew/brew/': LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443

curl: (35) LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443
```

```sh
git config --global http.sslVerify false

# Darwin
# ( cd /usr/local/Homebrew && git config http.sslVerify false )

# for dir in /usr/local/Homebrew/Library/Taps/homebrew/*; do (cd "$dir" && git config http.sslVerify false); done
```

#### Brew Lock

```log
Another active Homebrew process is already using \[name].formula.
```

```sh
rm -f /usr/local/var/homebrew/locks/{*.lock,update}
```

#### Installed without Homebrew

```log
Warning: Unbrewed header files were found in /usr/local/include.
```

```sh
brew doctor `brew doctor --list-checks | grep -v stray_headers`
```
