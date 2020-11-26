# Ruby

<!--
https://app.pluralsight.com/library/courses/ruby-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/reading-writing-data-ruby/table-of-contents
-->

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ruby \
  --name ruby \
  docker.io/library/ruby:2.7.0
```

## CLI

### Installation

#### Homebrew

```sh
brew install ruby
```

### Usage

```sh
# Version
ruby --version | head -1
```

### Tips

#### Visual Studio Code

```sh
code --install-extension misogi.ruby-rubocop
```

### Issues

#### Permission denied

```log
ERROR:  While executing gem ... (Errno::EACCES)
    Permission denied @ rb_sysopen - /Library/Ruby/Site/2.6.0/rubygems.rb
```

```sh
# Darwin
sudo chown -R "$USER":wheel /Library/Ruby/Site
```

<!-- #### Could not find a valid gem

```log
ERROR: Could not find a valid gem 'rake' (>= 0), here is why: windows
```

```sh
gem sources
gem sources -a http://rubygems.org/
gem sources --remove https://rubygems.org/
gem install rake
``` -->

<!-- #### Certificate verify failed

```log
SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
```

```sh
https://gist.github.com/luislavena/f064211759ee0f806c88
``` -->

#### Failed to build gem native extension

```log
ERROR: Failed to build gem native extension.
```

```sh
gem update --system
```

<!-- #### Psych:Module

```log
private method load called for Psych:Module
```

```sh
gem update --system
``` -->

<!-- #### Token

```log
NoMethodError (undefined method `[]' for nil:NilClass):
```

Need add `{}` or `nil`. -->

<!-- #### Nginx

```log
413 Request Entity Too Large
```

```sh
sudo vim /etc/nginx/sites-available/[appname]

server {
    client_max_body_size 8M;
}
```

```sh
sudo systemctl restart nginx
``` -->

<!-- #### MiniMagick::Error

##### APT

```log
MiniMagick::Error (ImageMagick/GraphicsMagick is not installed):
```

```sh
sudo apt update
sudo apt -y install imagemagick
``` -->
