# commitlint

## References

- [Code Repository](https://github.com/conventional-changelog/commitlint)
- [Main Website](https://commitlint.js.org/)

## Library

### Installation

```sh
# Using NPM
npm install \
  @commitlint/config-conventional \
  @commitlint/types \
    --save-dev

# Using Yarn
yarn add \
  @commitlint/cli \
  @commitlint/config-conventional \
  @commitlint/types \
    --dev
```

### Configuration

**Refer:** `./.commitlintrc.cjs`

```cjs
/**
 * @type { import("@commitlint/types").UserConfig }
 */
const commitlintRC = {
  extends: ['@commitlint/config-conventional'],
}

module.exports = commitlintRC
```

### Tips

#### Using with Husky

```sh
# Using NPM
npx husky add ./.husky/commit-msg 'npx --no-install commitlint --edit "$1"'
npx husky install

# Using Yarn
yarn husky add ./.husky/commit-msg 'yarn commitlint --edit "$1"'
yarn husky install
```

### Issues

#### Missing Staged `.eslintignore`

```log
/path/to/.commitlintrc.cjs
  0:0  warning  File ignored by default.  Use a negated ignore pattern (like "--ignore-pattern '!<relative/path/to/filename>'") to override
```

Add updated `.eslintignore` to staged files.

## CLI

### Commands

```sh
# Using NPX
npx @commitlint/cli -h
```
