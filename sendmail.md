# Sendmail

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install sendmail
```

#### YUM

```sh
yum check-update
sudo yum -y install sendmail
```

### Commands

```sh
man sendmail
```

### Configuration

#### Unix-like

```sh
#
GMAIL_USERNAME=
GMAIL_PASSWORD=

echo "smtp.gmail.com:587 $GMAIL_USERNAME@gmail.com:$GMAIL_PASSWORD" | sudo tee /etc/postfix/sasl_passwd

#
sudo postmap /etc/postfix/sasl_passwd

#
cat << EOF | sudo tee -a /etc/postfix/main.cf

relayhost=smtp.gmail.com:587
smtp_sasl_auth_enable=yes
smtp_sasl_password_maps=hash:/etc/postfix/sasl_passwd
smtp_use_tls=yes
smtp_tls_security_level=encrypt
tls_random_source=dev:/dev/urandom
smtp_sasl_security_options = noanonymous
smtp_always_send_ehlo = yes
smtp_sasl_mechanism_filter = plain
EOF

#
sudo postfix stop
sudo postfix start

#
mailq
```

### Test

```sh
#
echo 'Test email' | mail -s 'Sending an email using Mail' brunowego@gmail.com

#
sendmail brunowego@gmail.com << EOF
Subject: Sending an email using Sendmail
Test email
EOF
```
