# Microbundle

## CLI

### Installation

#### Yarn

```sh
# Globally
yarn global add microbundle

# Dependency
yarn add microbundle -D
```

#### NPM

```sh
npm install microbundle -g
```

#### NPX

```sh
npx microbundle -h
```

### Commands

```sh
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
