# Composer

<!--
https://typo3.org/article/certificate-issue-with-composer/
-->

## Links

- [Code Repository](https://github.com/composer/composer)
- [Main Website](https://getcomposer.org/)

## CLI

### References

- [The composer.json Schema](https://getcomposer.org/doc/04-schema.md)

### Installation

#### Homebrew

```sh
brew install composer
```

#### APT

```sh
sudo apt update
sudo apt -y install composer
```

#### YUM

```sh
yum check-update
sudo yum -y install composer-cli
```

#### Unix-like

```sh
#
curl -s https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer

# wget -O - https://getcomposer.org/installer | \
#   php -- --install-dir=/usr/local/bin --filename=composer
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y php-composer
```

#### Chocolatey

```sh
choco install -y composer
```

### Commands

```sh
composer help

# List commands
composer list
```

<!-- ### Configuration

```sh
cat ~/.composer/config.json | jq .
``` -->

### Usage

```sh
# Diagnose
composer diagnose -vvv

# Create
composer create-project --prefer-dist laravel/laravel <name> && "$_"

# Validate
composer validate

# Install
composer install

# Without deve dependencies
composer install --no-dev

#
composer install \
  --prefer-dist \
  -vvv \
  --profile

# Update
composer update

# Without deve dependencies
composer update --no-dev

#
composer dump-autoload \
  --optimize

# Config
## List Local
composer config -l

## List Global
composer config -gl

# Disable Packagist
composer config repo.packagist.org false

# Show Repo
composer config -l | grep repositories.packagist.org.url

# Set Repo
composer config repo.packagist composer https://packages.example.com

#
composer config secure-http false

# Search
composer search monolog

# Show
composer show monolog/monolog

# Unset Repo
composer config --unset repos.packagist

# Cache
composer clear-cache

# Archive
composer archive -f zip
```

### Tips

#### GitHub Token

```sh
#
export COMPOSER_TOKEN=''

#
composer config -g github-oauth.github.com "$COMPOSER_TOKEN"

#
cat ~/.composer/auth.json
```

#### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
echo '/composer.lock export-ignore' >> ./.gitattributes
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 composer\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

### Issues

#### Missing Compose User File

```log
Failed to initialize global composer: Composer could not find the config file: ~/.config/composer/composer.json
```

```sh
mkdir -p ~/.config/composer

echo '{}' >> ~/.config/composer/composer.json
```

#### Missing OpenSSL

```log
Checking platform settings: FAIL

The openssl extension is missing, which means that secure HTTPS transfers are impossible.
If possible you should enable it or recompile php with --with-openssl
```

Install [PHP OpenSSL](/php-openssl.md)

#### Disable TLS

```log
The openssl extension is required for SSL/TLS protection but is not available. If you can not enable the openssl extension, you can disable this error, at your own risk, by setting the 'disable-tls' option to true.
```

```js
// compose.json
{
  "config": {
    "disable-tls": true
  }
}
```

```sh
# Globally
composer config -g disable-tls true
```

#### Public Keys

```log
Checking pubkeys: FAIL
Missing pubkey for tags verification
Missing pubkey for dev verification
Run composer self-update --update-keys to set them up
```

Find [pubkeys here](https://composer.github.io/pubkeys.html).

```sh
composer self-update --update-keys
```

<!-- ####

```log
You must enable the openssl extension in your php.ini to load information from https://[hostname]
```

TODO -->

<!-- ####

```log
curl error 60 while downloading https://[hostname]/packages.json: SSL certificate problem: unable to get local issuer certificate
```

```sh
composer clear-cache

composer config -g repo.packagist false

composer config -g repo.packagist composer https://packages.example.com
```

```json
{
  "repositories": [
    {
      // ...
      "options": {
        "ssl": {
          "verify_peer": false,
          "allow_self_signed": true
        }
      }
    }
  ]
}
``` -->

<!-- ```sh
sudo curl -o /etc/ssl/certs/cacert.pem https://curl.haxx.se/ca/cacert.pem

sed -i 's/;\(curl\.cainfo =\)/\1 \/etc\/ssl\/certs\/cacert\.pem/g' "$(php -i | grep -oE /.+/php.ini)"

php -i | grep curl.cainfo

php -r 'print_r(openssl_get_cert_locations());'
``` -->

#### Composer CA File

```log
error:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed
```

<!-- ```sh
sudo curl -o /etc/ssl/certs/cacert.pem https://curl.haxx.se/ca/cacert.pem

sed -i 's/;\(openssl\.cafile=\)/\1\/etc\/ssl\/certs\/cacert\.pem/g' "$(php -i | grep -oE /.+/php.ini)"

php -i | grep openssl.cafile
``` -->

```sh
composer config -gl | grep cafile

composer config -g cafile '/usr/local/etc/openssl@1.1/cert.pem'
```

<!-- ####

```log
error:14090086:SSL routines:ssl3_get_server_certificate:certificate verify failed
```

https://support.acquia.com/hc/en-us/articles/360005829133-Certificate-issue-when-running-composer-commands

```sh
php -r 'var_dump(openssl_get_cert_locations());'

composer config -g cafile '/usr/local/etc/openssl/cert.pem'

composer config secure-http false
``` -->

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h composer \
  --name composer \
  docker.io/library/composer:2.1
```
