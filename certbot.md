# Certbot

<!--
https://ericnish.io/blog/renew-lets-encrypt-ssl-certificate-aws-cloudfront/
-->

## Links

- [Docs](https://certbot.eff.org/docs/)

## References

- [ACME Client Implementations](https://letsencrypt.org/docs/client-options/)

## CLI

### Installation

#### Homebrew

```sh
brew install certbot
```

#### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install software-properties-common
sudo add-apt-repository ppa:certbot/certbot

sudo apt update
sudo apt install -y certbot python3-certbot-apache
```

### Commands

```sh
certbot -h
```

### Usage

```sh
#
sudo certbot certonly --manual
sudo certbot certonly --standalone

#
sudo certbot certificates

#
sudo certbot renew
sudo certbot renew --dry-run
sudo certbot renew --cert-name [domain-name]
```

<!--
sudo ufw allow https
-->

<!--
sudo cat /etc/letsencrypt/live/example.com/cert.pem # Certificate body
sudo cat /etc/letsencrypt/live/example.com/privkey.pem # Certificate private key
sudo cat /etc/letsencrypt/live/example.com/fullchain.pem # Certificate chain
-->

<!-- ### Tips

####

```sh
#
sudo crontab -l
sudo crontab -e

#
30 4 1 * * sudo certbot renew --quiet
15 15 5 * * sudo certbot renew --quiet
``` -->
