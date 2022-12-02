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

### Initialize

```sh
#
bundle init
# or
cat << EOF > ./Gemfile
# frozen_string_literal: true

source 'https://rubygems.org'
EOF

#
bundle install
```

### Usage

```sh
#
bundle exec pod install
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
