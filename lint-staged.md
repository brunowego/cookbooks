# lint-staged

## Links

- [Code Repository](https://github.com/okonet/lint-staged)

## Library

### Installation

```sh
# Using NPM
# Use NPX

# Using Yarn
yarn add lint-staged --dev
```

### Configuration

**Dependencies:** [ESLint](/eslint.md), [Prettier](/prettier.md)

```sh
#
cat << EOF > ./.lintstagedrc.mjs
/**
 * @type { Record<string, string> }
 */
const lintStagedRC = {
  '*.{cjs,mjs,ts,tsx}': 'eslint --fix --max-warnings 0',
  '*.{css,json,md,mjs,tsx}': 'prettier --write',
}

export default lintStagedRC
EOF

#
echo '!/.lintstagedrc.mjs' >> ./.eslintignore
```

<!--
/**
 * @type { Record<string, (filenames: string[]) => string[]> }
 */
const lintStagedRC = {
  '*.{cjs,mjs}': (filenames) => [`eslint --fix --max-warnings 0 ${filenames.join(' ')}`],
  '*.{json,md,mjs}': () => ['prettier --write'],
}

export default lintStagedRC
-->

### Tips

#### Using with Husky

```sh
# Using NPM
npx husky add ./.husky/pre-commit 'npx --no-install lint-staged'
npx husky install

# Using Yarn
yarn husky add ./.husky/pre-commit 'yarn lint-staged'
yarn husky install
```

### Issues

#### Allow Empty

```log
✖ Prevented an empty git commit!
```

```sh
npx lint-staged --allow-empty
```

#### Missing Prettier

```log
✖ prettier --write failed without output (ENOENT).
```

Missing [Prettier](/prettier.md) package installation.

<!-- #### TBD

```log
npm WARN exec The following package was not found and will be installed: lint-staged
```

TODO -->

## CLI

### Commands

```sh
npx lint-staged -h
```

### Usage

```sh
#
npx lint-staged
# or
npx lint-staged --concurrent false

# Debug
npx lint-staged -dv
```
