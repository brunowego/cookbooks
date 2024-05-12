# Mailpit

## Links

- [Code Repository](https://github.com/axllent/mailpit)
- [Main Website](https://mailpit.axllent.org)

## CLI

### Installation

#### Homebrew

```sh
brew install mailpit
```

### Commands

```sh
mailpit -h
```

### Usage

```sh
#
mailpit
```

## Test

### Send Email

```sh
#
telnet '127.0.0.1' 1025
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

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mailpit \
  -p 1025:1025 \
  -p 8025:8025 \
  --name mailpit \
  docker.io/axllent/mailpit:v1.8
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8025'
```

### Remove

```sh
docker rm -f mailpit
```
