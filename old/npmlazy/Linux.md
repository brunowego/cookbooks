# Linux

## Installation

### APT

```sh
curl -Ss 'https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh' | /bin/bash
```

## Configuration

```sh
su - $USER
nvm install stable
nvm use stable
nvm alias default stable
```

```sh
npm install npm_lazy -g
```

```sh
npm_lazy --init > ~/npm_lazy.config.js
npm_lazy --config ~/npm_lazy.config.js
```

```sh
npm --registry http://127.0.0.1:8080 install socket.io
npm config set registry http://127.0.0.1:8080
```

```sh
touch .npmrc || exit
```

```ini
registry = http://127.0.0.1:8080
```
