# Exim Internet Mailer

## CLI

### Installation

#### Homebrew

```sh
brew install exim
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mail \
  -p 25:25 \
  --name mail \
  docker.io/bytemark/smtp:latest

# SMTP Smart Host
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mail \
  -e RELAY_HOST='smtp.gmail.com' \
  -e RELAY_PORT='587' \
  -e RELAY_USERNAME='[username]@gmail.com' \
  -e RELAY_PASSWORD='[password]' \
  -p 25:25 \
  --name mail \
  docker.io/bytemark/smtp:latest
```

### Remove

```sh
docker rm -f mail
```

## Test

### Send Email

```sh
telnet 127.0.0.1 25
```

AUTH LOGIN

```txt
EHLO mail.example.com
MAIL FROM: <noreply@example.com>
RCPT TO: <[username]@example.com>
DATA
Subject: Sending an email using exim

Hello,
This is an email sent by using the exim command.

Your friend,
Me!
.
QUIT
```
