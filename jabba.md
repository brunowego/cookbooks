# jabba

## CLI

### Installation

#### Unix-like

```sh
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | /bin/bash -s -- --skip-rc
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# jabba
source "$HOME/.jabba/jabba.sh"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
jabba --help
```

### Usage

```sh
# Remote
jabba ls-remote

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

export JAVA_VERSION="`/usr/libexec/PlistBuddy -c 'Print :JavaVM:JVMVersion' $(dirname $(/usr/libexec/java_home -v 1.8))/Info.plist`"
jabba link system@$JAVA_VERSION $(dirname $(dirname $(/usr/libexec/java_home -v 1.8)))

export JAVA_VERSION="`/usr/libexec/PlistBuddy -c 'Print :JavaVM:JVMVersion' $(dirname $(/usr/libexec/java_home -v 14.0))/Info.plist`"
jabba link system@$JAVA_VERSION $(dirname $(dirname $(/usr/libexec/java_home -v 14.0)))

jabba ls
```

### Uninstall

```sh
jabba uninstall [version]
```
