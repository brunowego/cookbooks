# Node.js

<!--
https://www.linkedin.com/learning/node-js-essential-training-3/learn-the-node-js-fundamentals
-->

## Related

- [Node version management (n)](/n.md)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h node \
  --name node \
  docker.io/library/node:13.5.0-alpine /bin/sh
```

## CLI

### Installation

#### Homebrew

```sh
brew install nodejs
```

#### YUM

```sh
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -

yum check-update
sudo yum -y install nodejs
```

#### APT

```sh
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt update
sudo apt -y install nodejs
```

#### APK

```sh
apk update
apk add nodejs
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y nodejs10
```

#### Chocolatey

```sh
choco install -y nodejs
```

#### Source

##### Dependencies

###### APT

```sh
sudo apt update
sudo apt -y install curl g++ make
```

##### Build & Install

```sh
curl https://nodejs.org/dist/v11.8.0/node-v11.8.0.tar.gz | tar -xz
( cd ./node-v11.8.0 && ./configure && make && sudo make install ) && rm -r ./node-v11.8.0
```

### Configuration

- [stylelint](/stylelint.md#configuration)

#### Windows

##### Node path

```sh
setx /m NODE_PATH %AppData%\npm\node_modules
```

### Commands

```sh
node -h
```

### Usage

```sh
# Version
node --version | head -1

# REPL
node
```

### Tips

#### Visual Studio Code

```sh
code --install-extension wix.vscode-import-cost
```
