# Certbot

**Keywords:** ACME Client Implementation

## Links

- [Main Website](https://certbot.eff.org/)
- [Docs](https://certbot.eff.org/docs)

## Issues

- [Please let me reuse a key during cert renewal](https://github.com/certbot/certbot/issues/3788)

## CLI

### Dependencies

- Ubuntu
  - [Software Properties Common](/apt/software-properties-common.md#installation)

### Installation

```sh
# Using Homebrew
brew install certbot

# Using APT
sudo add-apt-repository ppa:certbot/certbot

sudo apt update
sudo apt install -y certbot python3-certbot-apache # for HTTPd (Apache)
sudo apt install -y certbot python3-certbot-nginx # for Nginx

# Using YUM
sudo check update
sudo yum install -y certbot

# Using APK
sudo apk update
sudo apk add certbot
```

### Configuration

```sh
# Unix-like
sudo mkdir -p {/etc,/var/{lib,log}}/letsencrypt

sudo chown -R "$(whoami)" {/etc,/var/{lib,log}}/letsencrypt

#
export DOMAIN='<xyz.tld>'
export EMAIL='<email>'

cat << EOF >> /etc/letsencrypt/cli.ini
domains = $DOMAIN
authenticator = manual # standalone
email = $EMAIL
EOF
```

<!--
reuse-key = True
-->

### Commands

```sh
certbot -h all
```

### Bootstrap

```sh
#
certbot register \
  -n \
  --agree-tos

#
certbot show_account

#
certbot update_account

#
certbot unregister
```

### Usage

```sh
#
certbot certificates

#
certbot certonly

#
certbot renew --dry-run

#
certbot revoke

#
certbot delete
```

<!--
ls /etc/letsencrypt/live/<xyz.tld>
-->

### Tips

#### Automatic Renew

```sh
(crontab -l 2>/dev/null; echo '0 8 * */3 * certbot renew --quiet') | crontab - # Every 3 months
```
