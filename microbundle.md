# Microbundle

## CLI

### Installation

```sh
# Using NPM
npm install microbundle -g

# Using Yarn 1.x
yarn global add microbundle
```

### Commands

```sh
# Using NPX
npx microbundle -h

# Using Local
microbundle -h
```

### Configuration

```sh
./lib/index.js
```

```json
"source": "lib/index.js",
"scripts": {
  "dev": "microbundle watch --jsx React.createElement ./lib/*.js"
}
```
