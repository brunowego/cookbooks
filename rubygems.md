# RubyGems

## Links

- [Main Website](https://rubygems.org/)

## CLI

### Commands

```sh
gem -h
```

### Configuration

```sh
# No Document
echo 'gem: --no-document' > ~/.gemrc

# Remove existing docs
ls -la "$(gem env gemdir)"/doc
rm -fR "$(gem env gemdir)"/doc/*
```

### Usage

```sh
#
gem list --local
```

### Tips

#### Remove All Gems

```sh
gem uninstall -aIx
```

#### Proxy

```sh
# HTTP(S)
cat << EOF >> ~/.gemrc
http_proxy: http://$PROXY_HOST:$PROXY_PORT
https_proxy: http://$PROXY_HOST:$PROXY_PORT
EOF

# With Authentication
cat << EOF >> ~/.gemrc
http_proxy_user: $PROXY_USERNAME
http_proxy_pass: $PROXY_PASSWORD
https_proxy_user: $PROXY_USERNAME
https_proxy_pass: $PROXY_PASSWORD
EOF

# Check
gem env | grep -i _proxy | sort
```

### Issues

#### Missing Gemfile

```log
Could not locate Gemfile
```

```sh
#
bundle init
# or
cat << EOF > ./Gemfile
# frozen_string_literal: true

source 'https://rubygems.org'
EOF
```

#### File permission error

```log
You don't have write permissions for the /Library/Ruby/Gems/2.6.0 directory.
```

```sh
# Homebrew
sudo chown -R `whoami` /Library/Ruby/Gems
```
