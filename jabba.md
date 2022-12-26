# jabba

**Keywords:** Java Version Manager

## Links

- [Code Repository](https://github.com/shyiko/jabba)

## CLI

### Dependencies

- Linux
  - [OpenJDK JRE - Java Runtime Environment](/openjdk/jre.md)

### Installation

#### Unix-like

```sh
curl -sL 'https://github.com/shyiko/jabba/raw/master/install.sh' | \
  /bin/bash -s -- --skip-rc
```

### Environment

#### Unix-like

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# jabba
source "$HOME/.jabba/jabba.sh"

[ -e './.jabbarc' ] && jabba use &>/dev/null
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
echo 'adopt@1.8.0-252' > ./.jabbarc

# Git ignore
echo '/.jabbarc' >> ~/.gitignore_global
```

### Usage

```sh
# Remote
jabba ls-remote
jabba ls-remote 'adopt@' --latest minor
jabba ls-remote 'adopt-openj9@' --latest minor
jabba ls-remote 'amazon-corretto@' --latest minor
jabba ls-remote 'graalvm@' --latest minor
jabba ls-remote 'graalvm-ce-java11@' --latest minor
jabba ls-remote 'liberica@' --latest minor
jabba ls-remote 'openjdk@' --latest minor
jabba ls-remote 'zulu@' --latest minor

# Install
jabba install # if have .jabbarc file
jabba install <version>

# List
jabba ls

# Use
jabba use <version>

# Show current
jabba current

# Alias
jabba alias default <version>

#
jabba uninstall <version>
```

### Tips

#### Java Home

**Warning:** Not use if are using [jabba](/jabba.md).

```sh
# Java Home
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"
export PATH="$JAVA_HOME/bin:$PATH"
```

```sh
sudo su - "$USER"
```

#### Install from Compacted File

```sh
#
wget 'https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz'

#
jabba install openjdk@1.11.0="tgz+file://$PWD/openjdk-11.0.2_linux-x64_bin.tar.gz"
```

#### Link System Version

```sh
# Darwin
/usr/libexec/java_home -V

#
export JAVA_VERSION="`/usr/libexec/PlistBuddy -c 'Print :JavaVM:JVMVersion' "$(dirname "$(/usr/libexec/java_home -v 1.8)")"/Info.plist`"

#
export JAVA_VERSION="`/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' "$(dirname "$(/usr/libexec/java_home -v 1.8)")"/Info.plist`"

# FIXME: 1.8.0_265 is not a valid version / 1.8.0-265 is a valid version
jabba link system@"$JAVA_VERSION" "$(dirname "$(dirname "$(/usr/libexec/java_home -v 1.8)")")"

jabba ls
```
