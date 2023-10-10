# cross-env

## CLI

### Installation

#### NPM

```sh
# Using NPM
npm install cross-env --save-dev

# Using Yarn
yarn add cross-env --dev

#
pnpm add cross-env -D
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "start": "cross-env NODE_ENV='production' node ./index.js",
    "dev": "cross-env NODE_ENV='development' nodemon ./index.js"
  }
}
```
