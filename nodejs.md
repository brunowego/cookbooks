# Node.js

<!--
https://app.pluralsight.com/paths/skills/working-with-nodejs
https://linkedin.com/learning/node-js-essential-training-3/learn-the-node-js-fundamentals
-->

## Links

- [Code Repository](https://github.com/npm/cli)
- [Main Website](https://npmjs.com)
- [Community Website](https://npm.community)
- [Releases](https://nodejs.org/en/about/releases/)
- [Status Page](https://status.npmjs.org/)

## Guides

- [package.json](https://docs.npmjs.com/cli/v8/configuring-npm/package-json)

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
curl 'https://nodejs.org/dist/v11.8.0/node-v11.8.0.tar.gz' | \
  tar -xz

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

#### Engines Definition

```json
{
  // ...
  "engines": {
    "node": ">=14 <15",
    "npm": ">=6 <7"
  }
}
```

#### Command-line completion

```sh
# Using Antigen
antigen bundle node
```

#### Visual Studio Code

```sh
code --install-extension wix.vscode-import-cost
```

### Issues

#### VSCode JavaScript Validate

```log
File is a CommonJS module; it may be converted to an ES6 module.ts (80001)
```

```sh
jq '."javascript.validate.enable" |= false' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"
```

<!-- ####

```log
with exit code 134
```

https://stackoverflow.com/questions/59766839/error-code-elifecycle-npm-err-errno-134

```sh
export NODE_OPTIONS='--max-old-space-size=8192'
```
-->
