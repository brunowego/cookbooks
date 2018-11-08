# Linux

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install git make openssl-devel readline-devel zlib-devel
```

## Installation

```sh
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
( cd ~/.rbenv && ./src/configure && make -C src )
```

```sh
mkdir -p ~/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

```sh
sudo su - $USER
```
