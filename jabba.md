# jabba

## CLI

### Installation

#### Unix-like

```sh
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | \
  /bin/bash -s -- --skip-rc
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# jabba
source "$HOME/.jabba/jabba.sh"
[ -e './.jabbarc' ] && jabba use &>/dev/null

# if test -e './.jabbarc'; then
#   jabba use &>/dev/null
# fi
```

```sh
sudo su - "$USER"
```

### Commands

```sh
jabba --help
```

### Configuration

```sh
# Local project
echo 'adopt@1.8.0-172' > ./.jabbarc

# Git ignore
echo '/.jabbarc' >> ~/.gitignore_global
```

### Usage

```sh
# Remote
jabba ls-remote
jabba ls-remote 'adopt@' --latest minor

# Install
jabba install [version]

# List
jabba ls

# Use
jabba use [version]

# Current
jabba current

# Alias
jabba alias default [version]
```

### Tips

#### Link System Version

```sh
# Darwin
/usr/libexec/java_home -V

#
export JAVA_VERSION="`/usr/libexec/PlistBuddy -c 'Print :JavaVM:JVMVersion' $(dirname $(/usr/libexec/java_home -v 1.8))/Info.plist`"
# FIXME: 1.8.0_265 is not a valid version / 1.8.0-265 is a valid version
jabba link system@"$JAVA_VERSION" $(dirname $(dirname $(/usr/libexec/java_home -v 1.8)))

jabba ls
```

### Uninstall

```sh
jabba uninstall [version]
```
