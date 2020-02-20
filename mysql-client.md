# MySQL Client

## CLI

### Installation

#### Homebrew

```sh
brew install mysql-client
```

#### APT

```sh
sudo apt update
sudo apt -y install mysql-client
```

#### YUM

```sh
yum check-update
sudo yum -y install mysql
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# MySQL Client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
```

```sh
sudo su - "$USER"
```
