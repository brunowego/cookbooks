# Node.js

<!--
https://app.pluralsight.com/paths/skills/working-with-nodejs
https://linkedin.com/learning/node-js-essential-training-3/learn-the-node-js-fundamentals
-->

<!--
> 20.6 read .env files native
-->

## Links

- [Code Repository](https://github.com/npm/cli)
- [Main Website](https://npmjs.com)
- [Community Website](https://npm.community)
- [Releases](https://nodejs.org/en/about/releases/)
- [Status Page](https://status.npmjs.org/)
- API
  - [Corepack](https://nodejs.org/api/corepack.html)

## Guides

- [package.json](https://docs.npmjs.com/cli/v8/configuring-npm/package-json)
- [Optional chaining (?.)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)

## Related

- [Node version management (n)](/n.md)

## Package Manager

- [Node Package Manager (NPM)](/npm/README.md)
- [Performant NPM (pnpm)](/pnpm/README.md)
- [Yarn](/yarn/README.md)

## Version Manager

- [Node version management (n)](/n.md)
- [Node Version Manager (nvm)](/nvm.md)

<!--
https://github.com/Schniz/fnm
-->

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h node \
  --name node \
  docker.io/library/node:13.5.0-alpine /bin/sh
```

## Dockerfile

```Dockerfile
FROM docker.io/library/node:18.12-alpine
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
sudo DEBIAN_FRONTEND=noninteractive apt -y install nodejs
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

#### Kill Node.js Processes

```sh
#
killall node

# Or
kill -9 $(ps aux | grep node | grep -v grep | awk '{print $2}')
```

#### Engines Definition

```json
{
  // ...
  "engines": {
    "node": ">=18 <19",
    "npm": ">=8 <9"
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
#
code --install-extension wix.vscode-import-cost

#
jq '."recommendations" += ["wix.vscode-import-cost"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### OpenSSL Legacy Provider

```log
Error: error:0308010C:digital envelope routines::unsupported
    ...
Error: error:0308010C:digital envelope routines::unsupported
    ...
node:internal/crypto/hash:71
  this[kHandle] = new _Hash(algorithm, xofLen);
                  ^
Error: error:0308010C:digital envelope routines::unsupported
    ... {
  opensslErrorStack: [ 'error:03000086:digital envelope routines::initialization error' ],
  library: 'digital envelope routines',
  reason: 'unsupported',
  code: 'ERR_OSSL_EVP_UNSUPPORTED'
}
```

```sh
export NODE_OPTIONS='--openssl-legacy-provider'
```

#### Missing Python2

```log
gyp ERR! stack pyenv: python2: command not found
gyp ERR! stack
gyp ERR! stack The `python2' command exists in these Python versions:
```

```sh
#
pyenv versions
pyenv local 2.7.18
```

#### VSCode JavaScript Validate

```log
File is a CommonJS module; it may be converted to an ES6 module. ts(80001)
```

```sh
jq '."javascript.validate.enable" |= false' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
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
