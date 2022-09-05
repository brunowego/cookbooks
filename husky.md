# Husky

## Alternatives

- [pre-commit](/pre-commit.md)
- git-hooks

## Links

- [Code Repository](https://github.com/typicode/husky)
- [Main Website](https://typicode.github.io/husky/#/)

## CLI

### Installation

```sh
# Using NPM
npm install husky --save-dev

# Using Yarn
yarn add husky --dev
```

### Commands

```sh
# Using NPX
npx husky

# Using Local
husky
```

### Bootstrap

**Refer:** `./package.json`

```json
{
  "scripts": {
    "prepare": "husky install"
    // ...
  }
}
```

```sh
#
npm run prepare
```

### Extend

- [lint-staged](/lint-staged.md#using-with-husky)
- [commitlint](/conventional-changelog/commitlint.md#using-with-husky)

<!-- ### Configuration

```sh
#
npx husky add ./.husky/pre-commit 'npm test'

#
npx husky install
``` -->
