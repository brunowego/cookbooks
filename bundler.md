# Bundler

## CLI

### Installation

#### RubyGems

```sh
gem install bundler -n /usr/local/bin
```

### Commands

```sh
bundler -h
```

### Issues

#### Bundle Path

```log
Your user account isn't allowed to install to the system RubyGems.
```

```sh
bundle config set path './vendor/bundle'
bundle install
```
