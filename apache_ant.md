# Apache Ant

## CLI

### Installation

#### Homebrew

```sh
brew install ant
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Apache Ant
export ANT_HOME='/usr/local/opt/ant/libexec'
export CLASSPATH="${CLASSPATH}${CLASSPATH:+:}${ANT_HOME}/lib/*:."
```
