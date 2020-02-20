# docker-mailserver

## References

- [Usage](https://github.com/tomav/docker-mailserver#usage)

## Volumes

```sh
docker volume create docker-mailserver-data
docker volume create docker-mailserver-state
docker volume create docker-mailserver-logs
```

## Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mail \
  --domainname example.com \
  -v docker-mailserver-data:/var/mail \
  -v docker-mailserver-state:/var/mail-state \
  -v docker-mailserver-logs:/var/log/mail \
  -e OVERRIDE_HOSTNAME='mail.example.com' \
  -e DMS_DEBUG='0' \
  -e ONE_DIR='0' \
  -e POSTMASTER_ADDRESS='postmaster@example.com' \
  -e ENABLE_CLAMAV='0' \
  -e ENABLE_FAIL2BAN='0' \
  -e ENABLE_MANAGESIEVE='' \
  -e SSL_TYPE='' \
  -e ENABLE_SPAMASSASSIN='0' \
  -e ENABLE_POSTGREY='0' \
  -p 25:25 \
  -p 143:143 \
  -p 587:587 \
  -p 993:993 \
  --name docker-mailserver \
  --cap-add NET_ADMIN \
  --cap-add SYS_PTRACE \
  docker.io/tvial/docker-mailserver:stable
```

```sh
docker exec -i \
  -e MAIL_USER='admin@example.com' \
  -e MAIL_PASS='Pa$$w0rd!' \
  docker-mailserver /bin/sh << \EOSHELL
mkdir -p /tmp/docker-mailserver

echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)" > /tmp/docker-mailserver/postfix-accounts.cf
EOSHELL
```

```sh
docker restart docker-mailserver
```

| Port | Description |
| --- | --- |
| `25` | Receiving email from other mailservers |
| `465`, `587` | SSL & TLS Client email submission (SMTP) |
| `143`, `993` | StartTLS & TLS/SSL IMAP client |
| `110`, `995` | POP3 & TLS/SSL POP3 client |
| `4190` | Manage Sieve port |

## Remove

```sh
docker rm -f docker-mailserver
docker volume rm docker-mailserver-data docker-mailserver-state docker-mailserver-logs
```

## Test

### Send Email

```sh
#
telnet 127.0.0.1 25

#
openssl s_client \
  -connect 127.0.0.1:587 \
  -starttls smtp
```

```txt
EHLO mail.example.com
MAIL FROM: <fromuser@example.com>
RCPT TO: <touser@example.com>
DATA
Subject: Sending an email using telnet

Hello,
This is an email sent by using the telnet command.

Your friend,
Me!
.
QUIT
```
