# Husky

## Alternatives

- [pre-commit](/pre-commit.md)
- git-hooks

## Links

- [Code Repository](https://github.com/typicode/husky)
- [Main Website](https://typicode.github.io/husky/#/)

## CLI

### Commands

```sh
npx husky
```

### Installation

```sh
# Using NPM
npm install husky --save-dev

# Using Yarn
yarn add husky --dev
```

### Bootstrap

**Refer:** `./package.json`

```json
{
  "scripts": {
    "prepare": "husky install",
    // ...
  }
}
```

```sh
#
npm run prepare
```

### Usage

```sh
#
npx husky add ./.husky/pre-commit 'npm test'

#
npx husky install
```
