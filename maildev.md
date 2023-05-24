# MailDev

## Links

- [Code Repository](https://github.com/maildev/maildev)
- [Main Website](https://maildev.github.io/maildev/)

## CLI

### Installation

#### NPM

```sh
npm install maildev -g
```

### Commands

```sh
maildev -h
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h maildev \
  -p 25:25 \
  -p 80:80 \
  --name maildev \
  docker.io/djfarrelly/maildev:1.1.0 \
    -s 25 \
    -w 80 \
    --incoming-user '' \
    --incoming-pass ''
```

```sh
echo -e '[INFO]\thttp://127.0.0.1'
```

### Remove

```sh
docker rm -f maildev
```

## Test

```sh
telnet 127.0.0.1 1025
```

```txt
EHLO relay.xyz.tld
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
