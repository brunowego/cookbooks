# lint-staged

## Library

### Installation

#### Yarn

```sh
yarn add lint-staged -D
```

### Configuration

```sh
cat << EOF > ./.lintstagedrc.json
{
  "*.js": "eslint --fix",
  "*.{json,md}": "prettier --write"
}
EOF
```
