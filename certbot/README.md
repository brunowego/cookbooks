# Certbot

**Keywords:** ACME Client Implementation

## Links

- [Main Website](https://certbot.eff.org/)
- [Docs](https://certbot.eff.org/docs/)

## Issues

- [Please let me reuse a key during cert renewal](https://github.com/certbot/certbot/issues/3788)

## CLI

### Dependencies

- Ubuntu
  - [Software Properties Common](/apt/software-properties-common.md#installation)

### Installation

#### Homebrew

```sh
brew install certbot
```

#### APT

```sh
sudo add-apt-repository ppa:certbot/certbot

sudo apt update
sudo apt install -y certbot python3-certbot-apache
```

#### YUM

```sh
sudo check update
sudo yum install -y certbot
```

#### APK

```sh
sudo apk update
sudo apk add certbot
```

### Configuration

```sh
# Unix-like
sudo mkdir -p {/etc,/var/{lib,log}}/letsencrypt

sudo chown -R "$(whoami)" {/etc,/var/{lib,log}}/letsencrypt

cat << EOF > /etc/letsencrypt/cli.ini
domains = <domain.tld>, <www.domain.tld>
authenticator = manual # standalone
email = <email>
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
ls /etc/letsencrypt/live/<domain.tld>
-->

### Tips

#### Automatic Renew

```sh
(crontab -l 2>/dev/null; echo '0 8 * */3 * certbot renew --quiet') | crontab -
```
