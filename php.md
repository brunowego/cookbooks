# PHP: Hypertext Preprocessor

<!--
https://app.pluralsight.com/library/courses/php-big-picture/table-of-contents
https://app.pluralsight.com/library/courses/working-databases-php/table-of-contents

https://www.linkedin.com/learning/learning-php-4/should-you-learn-php
https://front-line-php.com/
-->

## References

- [PHP Benchmarks](https://kinsta.com/blog/php-benchmarks)

## CLI

### Installation

#### Homebrew

```sh
brew install php
```

#### APT

```sh
sudo apt update
sudo apt -y install php
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
curl https://php.net/distributions/php-7.3.13.tar.gz | tar -xz

# GNU Wget
wget -O - https://php.net/distributions/php-7.3.13.tar.gz | tar -xz

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
```

#### Info

```sh
# All informations
php -i

# File path
php -i | grep -oE /.+/php.ini
```

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

### Visual Studio Code

```sh
code \
  --install-extension bmewburn.vscode-intelephense-client \
  --install-extension ikappas.phpcs
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

- [](https://www.php.net/manual/en/function.serialize.php)
- [](https://www.php.net/manual/en/function.unserialize.php)
