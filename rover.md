# Rover

**Keyword:** Terraform Graph

## Links

- [Code Repository](https://github.com/im2nguyen/rover)

## CLI

### Installation

```sh
# Darwin
wget \
  'https://github.com/im2nguyen/rover/releases/download/v0.3.3/rover_0.3.3_darwin_amd64.zip' \
  -O /tmp/rover.zip

# Linux
wget \
  'https://github.com/im2nguyen/rover/releases/download/v0.3.3/rover_0.3.3_darwin_amd64.zip' \
  -O /tmp/rover.zip

( cd /tmp && unzip ./rover.zip -d /usr/local/bin && rm ./rover.zip )

# TODO: Better this
mv /usr/local/bin/rover_v0.3.3 /usr/local/bin/rover
```

### Commands

```sh
rover -h
```

### Usage

```sh
#
rover

#
rover -standalone
```

<!--
#
rover -workingDir ./ -tfPath ./.terraform
-->

## Docker

### Running

```sh
docker run --rm -it \
  -v $(pwd):/src \
  -v $HOME/.terraform.d/credentials.tfrc.json:/root/.terraform.d/credentials.tfrc.json \
  -e TF_VAR_smtp_user=bruno.wego@londonbridge.com.br \
  -e TF_VAR_smtp_pass=ebsvequrxddcdvsy \
  --entrypoint /bin/sh \
  -p 9000:9000 \
  docker.io/im2nguyen/rover:v0.3.3
```
