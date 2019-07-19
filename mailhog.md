# MailHog

## Docker

### Running

```sh
docker run -d \
  -h mailhog \
  -p 1025:1025 \
  -p 8025:8025 \
  --name mailhog \
  --restart always \
  mailhog/mailhog:latest
```

## Test

### Send Email

```sh
telnet "$(docker-machine ip)" 1025
```

```txt
EHLO example.com
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
