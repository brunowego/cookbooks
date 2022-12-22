# Bundler (RubyGems)

## Links

- [Main Website](https://bundler.io/)

## CLI

**Notes:** Bellow commands works with version [1.17](https://bundler.io/v1.17/man/bundle-config.1.html).

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

### Configuration

```sh
#
bundle config

#
bundle config --local path ./vendor/bundle

#
echo '/vendor/bundle' >> ./.gitignore
```

### Usage

```sh
#
bundle check
# or
bundle doctor

#
bundle env

#
bundle exec <command>
```

### Tips

#### Visual Studio Code

```sh
jq '."files.associations"."**/.bundle/config" |= "yaml"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

### Issues

#### Bundle Path

```log
Your user account isn't allowed to install to the system RubyGems.
```

Set project Bundler config path.
