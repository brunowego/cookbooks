# lint-staged

## Links

- [Code Repository](https://github.com/okonet/lint-staged)

## Library

### Commands

```sh
npx lint-staged -h
```

### Configuration

**Dependencies:** [ESLint](/eslint.md), [Prettier](/prettier.md)

```sh
#
cat << EOF > ./.lintstagedrc.mjs
const lintStagedRC = {
  '*.{mjs,ts,tsx}': 'eslint --fix --max-warnings 0',
  '*.{css,json,md,mjs,tsx}': 'prettier --write',
}

export default lintStagedRC
EOF

#
echo '!/.lintstagedrc.mjs' >> ./.eslintignore
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

### Tips

#### Using with Husky

```sh
#
npx husky add ./.husky/pre-commit 'npx lint-staged'

#
npx husky install
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
