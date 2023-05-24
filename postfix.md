# Postfix

<!--
https://github.com/kwilczynski/packer-templates/blob/master/scripts/vagrant/packages.sh
https://github.com/Intracto/SecretSanta/blob/master/shell_provisioner/module/mailhog.sh
https://www.linode.com/docs/email/postfix/postfix-smtp-debian7/
-->

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postfix \
  -e MAILDOMAIN='mail.xyz.tld' \
  -e SMTP_USER='<user>:<pass>' \
  -p 25:25 \
  --name postfix \
  docker.io/catatnight/postfix:latest
```

### Remove

```sh
docker rm -f postfix
```

## CLI

### Installation

#### APT

```sh
sudo apt update

(cat << EOF
postfix postfix/main_mailer_type string "Internet Site"
postfix postfix/mailname string HOSTNAME.xyz.tld
postfix postfix/root_address string ROOTMAIL@xyz.tld
postfix postfix/myhostname string 0.0.0.0/0
postfix postfix/mynetworks string 0.0.0.0/0
EOF
) | debconf-set-selections

debconf-show postfix

sudo DEBIAN_FRONTEND=noninteractive apt -y install postfix
```

#### YUM

```sh
yum check-update
sudo yum -y install postfix
```

### Service

```sh
# Systemd
sudo systemctl enable --now postfix
```

### Configuration

```sh
# Hostname
## CentOS
sudo sed -i '/^#myhostname = virtual.xyz.tld/a myhostname = xyz.tld' /etc/postfix/main.cf

## Ubuntu
sudo sed -ie '/^myhostname =/ s/= .*/= xyz.tld/' /etc/postfix/main.cf

#
echo 'admin@xyz.tld admin:admin' | sudo tee /etc/postfix/sasl_passwd

#
sudo postmap /etc/postfix/sasl_passwd
```

### Test

#### TBD

```sh
echo "body of your email" | mail -s "This is a Subject" -a "From: you@xyz.tld" recipient@elsewhere.com
```

#### Send Email

```sh
telnet '127.0.0.1' 25
```

```txt
EHLO xyz.tld
MAIL FROM: <fromuser@xyz.tld>
RCPT TO: <touser@xyz.tld>
DATA
Subject: Sending an email using telnet

Hello,
This is an email sent by using the telnet command.

Your friend,
Me!
.
QUIT
```

### Issues

#### IPv6 Support

```log
fatal: parameter inet_interfaces: no local interface found for ::1
```

[Disable IPv6](/ipv6.md#disable) support.
