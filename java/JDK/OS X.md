# OS X

## Installation

### Homebrew

```sh
brew cask install java
```

## Environment

### Homebrew

```sh
sudo tee `brew --prefix`/etc/profile.d/java.sh << 'EOF'
export JAVA_HOME="`/usr/libexec/java_home`"
export PATH="$JAVA_HOME/bin:$PATH"
EOF
```

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# JAVA
. `brew --prefix`/etc/profile.d/java.sh
```

```sh
sudo su - $USER
```
