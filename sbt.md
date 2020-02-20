# Scala Build Tool (sbt)

## CLI

### Dependencies

- [Scala](/scala-lang.md)

### Installation

#### Homebrew

```sh
brew install sbt
```

#### YUM

```sh
curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo

sudo yum -y install sbt
```

#### Chocolatey

```sh
choco install -y sbt
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# sbt
export SBT_OPTS='-XX:+CMSClassUnloadingEnabled -XX:PermSize=256M -XX:MaxPermSize=512M'
```

```sh
sudo su - "$USER"
```

### Commands

```sh
sbt -h
```

### Tips

#### Visual Studio Code

```sh
code --install-extension lightbend.vscode-sbt-scala
```
