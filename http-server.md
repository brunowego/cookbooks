# http-server

## CLI

### Installation

#### NPM

```sh
# Using NPM
npm install http-server -g

# Using Yarn 1.x
yarn global add http-server

# Using Yarn 1.x
pnpm add http-server -D
```

### Commands

```sh
http-server -h
```

### Usage

```sh
#
http-server ./

#
http-server \
  ./ \
  -p 3000 \
  -a my-app.127.0.0.1.nip.io
```

### Tips

#### Using with SSL

Follow [instructions here](/mkcert.md#http-server).
