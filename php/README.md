# PHP: Hypertext Preprocessor

<!--
https://github.com/TheColvinCo/docker-images

https://app.pluralsight.com/library/courses/php-big-picture/table-of-contents
https://app.pluralsight.com/library/courses/working-databases-php/table-of-contents

https://linkedin.com/learning/learning-php-4/should-you-learn-php
https://front-line-php.com/

https://daniellockyer.com/php-flame-graphs/
-->

## References

- [PHP Benchmarks](https://kinsta.com/blog/php-benchmarks)
- [PHP Developer roadmap](https://github.com/thecodeholic/php-developer-roadmap)
- [The Repository Pattern](https://shawnmc.cool/2015-01-08_the-repository-pattern)

## Tools

- [Unserialize - PHP, JSON, Base64](https://unserialize.com)

## Terms

- Plain Old PHP Objects (POPO)

## Testing

- PHPUnit

## CLI

### Installation

#### Homebrew

```sh
brew install php
# brew install php@7.4
```

#### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install php
```

#### YUM

##### 5.x

```sh
yum check-update
sudo yum -y install php
```

##### 7.x

```sh
yum check-update

# Repo: Webtatic
sudo yum -y install php70w

# Repo: Software Collections
sudo yum -y install rh-php72
scl enable rh-php72 "$SHELL"
sudo sh -c 'echo "source scl_source enable rh-php72" >> /etc/profile.d/scl.sh'
```

#### APK

```sh
sudo apk update
sudo apk add php7
```

#### Chocolatey

```sh
choco install -y php
```

#### Source

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install gcc libxml2-devel bzip2-devel make
```

##### Build & Install

```sh
# cURL
curl 'https://php.net/distributions/php-7.3.13.tar.gz' | \
  tar -xz

# GNU Wget
wget -O - 'https://php.net/distributions/php-7.3.13.tar.gz' | \
  tar -xz

( cd ./php-7.3.13 && ./configure --with-bz2 && make && sudo make install ) && rm -r ./php-7.3.13
```

### Service

```sh
# Homebrew
brew services start php
```

### Commands

```sh
php -h
```

### Usage

```sh
# Version
php -v | head -1

# REPL
php -a

# Error info
php -i | grep error

# Server
php -S 127.0.0.1:8000
```

#### Info

```sh
# All informations
php -i

# File path
php -i | grep -oE /.+/php.ini
```

<!-- ```php
@ini_set( 'upload_max_size' , '64M' );
@ini_set( 'post_max_size', '64M');
@ini_set( 'max_execution_time', '300' );
@ini_set( 'max_input_vars', '2000' );
``` -->

#### Modules

```sh
# Unix-like
php -m | grep [name]

# Windows
php -m | findstr [name]
```

### Issues

#### Timezone

```log
PHP Warning: date_default_timezone_get(): It is not safe to rely on the system's timezone settings.
```

```sh
sudo sed -i 's|;date.timezone =|date.timezone = America/Sao_Paulo|g' "$(php -i | grep -oE /.+/php.ini)"
```

## Docker

### Running

```sh
# 7.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h php \
  --name php \
  docker.io/library/php:7.3

## FPM
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h php-fpm \
  -p 9000:9000 \
  --name php-fpm \
  docker.io/library/php:7.3-fpm
```

## Tips

### Show Loaded Extensions

```sh
#
php -r 'print_r(get_loaded_extensions());'

#
php -r 'var_dump(extension_loaded('json'));'

#
php -m
```

### Show All PHP Errors

```php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
```

### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.php]
indent_size = 4
EOF
```

### Visual Studio Code

**_Dependencies:_** [PHP CodeSniffer](/phpcs.md)

```sh
#
code --install-extension bmewburn.vscode-intelephense-client

#
jq '."recommendations" += ["bmewburn.vscode-intelephense-client"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Pretty Dump

```php
//
echo '<pre>' . var_export($data, true) . '</pre>';

//
echo '<pre>';
var_dump($data);
echo '</pre>';
```

### Serialize

```txt
a:1:{i:1;s:4:"test";
```

- [serialize](https://php.net/manual/en/function.serialize.php)
- [unserialize](https://php.net/manual/en/function.unserialize.php)
