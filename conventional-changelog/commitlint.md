# commitlint

<!--
https://github.com/editablejs/editable/blob/main/.commitlintrc
-->

## Links

- [Code Repository](https://github.com/conventional-changelog/commitlint)
- [Main Website](https://commitlint.js.org)

## Library

### Installation

#### Homebrew

```sh
brew install commitlint
```

#### NPM/Yarn

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

```sh
echo '!/.commitlintrc.cjs' >> ./.eslintignore
```

### Extend

#### With Trunk

```sh
#
trunk actions enable commitlint

#
trunk actions run commitlint
```

#### With Husky

```sh
# Using NPM
npx husky add ./.husky/commit-msg 'npx --no-install commitlint --edit "$1"'
npx husky install

# Using Yarn
yarn husky add ./.husky/commit-msg 'yarn commitlint --edit "$1"'
yarn husky install
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension joshbolduc.commitlint

#
jq '."recommendations" += ["joshbolduc.commitlint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### Missing Staged `.eslintignore`

```log
/path/to/.commitlintrc.cjs
  0:0  warning  File ignored by default.  Use a negated ignore pattern (like "--ignore-pattern '!<relative/path/to/filename>'") to override
```

Add updated `./.eslintignore` to staged files.

## CLI

### Commands

```sh
# Using NPX
npx @commitlint/cli -h
```
