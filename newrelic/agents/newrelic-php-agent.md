# New Relic PHP Agent

## Links

- [Code Repository](https://github.com/newrelic/newrelic-php-agent)
- [Download](https://download.newrelic.com/php_agent/archive/)
- [Docs](https://docs.newrelic.com/docs/agents/php-agent/)

## Using

- [Symfony](/symfony/symfony-newrelic.md)

## CLI

### Dependencies

- [PHP: Hypertext Preprocessor](/php/README.md)

#### APT

- [cURL](/curl.md)
- [GNU Privacy Guard](/gnupg.md)

#### Linux Library

- [cURL](/curl.md)
- [GNU Tar](/gnu-tar.md)

### Installation

#### APT

```sh
echo 'deb http://apt.newrelic.com/debian newrelic non-free' | sudo tee /etc/apt/sources.list.d/newrelic.list

# Using cURL
curl -fsSL https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -

# Using GNU wget
wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install newrelic-php5
```

#### YUM

```sh
sudo rpm -Uvh 'http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm'

yum check-update
sudo yum -y install newrelic-php5
```

#### Linux Library

```sh
#
NEWRELIC_VERSION='9.9.0.260'; \
  curl \
    -L "https://download.newrelic.com/php_agent/archive/${NEWRELIC_VERSION}/newrelic-php5-${NEWRELIC_VERSION}-linux-musl.tar.gz" | \
      tar -xzC /usr/lib --transform s/newrelic-php5-${NEWRELIC_VERSION}-linux-musl/newrelic-php5/

# If Automatically
export PATH="$PATH:/usr/lib/newrelic-php5"
```

### Bootstrap

#### Automatically

```sh
#
export NR_INSTALL_SILENT='true'

#
newrelic-install purge

#
export NR_INSTALL_KEY='[hash]'

#
newrelic-install install

#
sed -i '/^newrelic.appname/ s/".*"/"My App"/' "$(php -i | grep -oE /.+/conf.d$)/newrelic.ini"
```

#### Manually

```sh
#
export PHP_API_VERSION="$(php -i | grep 'PHP API' | sed -e 's/PHP API => //')"; echo "$PHP_API_VERSION"

ln -s "/usr/lib/newrelic-php5/agent/x64/newrelic-${PHP_API_VERSION}.so" "$(php -r 'echo ini_get("extension_dir");')/newrelic.so"

#
mkdir -p /etc/newrelic
mkdir -p /var/log/newrelic

#
cp '/usr/lib/newrelic-php5/daemon/newrelic-daemon.x64' '/usr/bin/newrelic-daemon'
cp '/usr/lib/newrelic-php5/scripts/newrelic.ini.template' "$(php -i | grep -oE /.+/conf.d$)/newrelic.ini"
cp '/usr/lib/newrelic-php5/scripts/newrelic.cfg.template' '/etc/newrelic/newrelic.cfg.template'

# /etc/conf.d/newrelic-daemon
# /etc/init.d/newrelic-daemon

#
export NR_INSTALL_KEY='[hash]'

sed -i "/^newrelic.license/ s/\".*\"/\"${NR_INSTALL_KEY}\"/" "$(php -i | grep -oE /.+/conf.d$)/newrelic.ini"
sed -i '/^newrelic.appname/ s/".*"/"My App"/' "$(php -i | grep -oE /.+/conf.d$)/newrelic.ini"
```
