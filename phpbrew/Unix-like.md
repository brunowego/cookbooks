# Linux

## Dependencies

### Homebrew

```sh
phpbrew lookup-prefix homebrew
```

```sh
brew install libxml2 mhash mcrypt pcre libzip
```

### YUM

```sh
sudo yum check-update
sudo yum -y install php
```

## Installation

```sh
sudo curl -L -o /usr/local/bin/phpbrew https://github.com/phpbrew/phpbrew/raw/master/phpbrew
sudo chmod +x /usr/local/bin/phpbrew
```

```sh
phpbrew init
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# PHPBrew
source ~/.phpbrew/bashrc
```

```sh
sudo su - $USER
```
