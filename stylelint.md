# stylelint

## References

- [List of rules](https://stylelint.io/user-guide/rules/list)

## CLI

### Installation

#### Yarn

```sh
yarn add -D stylelint stylelint-config-standard stylelint-order stylelint-scss
```

#### NPM

```sh
npm install stylelint stylelint-config-standard stylelint-order stylelint-scss -D
```

### Configuration

```sh
cat << EOF > ./.stylelintrc.json
{
  "extends": "stylelint-config-standard",
  "plugins": [
    "stylelint-order",
    "stylelint-scss"
  ],
  "rules": {
    "string-quotes": "single",
    "order/properties-alphabetical-order": true
  }
}

EOF
```

```sh
cat << EOF > ./.stylelintignore

EOF
```

### Extend

- [Prettier](/prettier.md)

### Tips

#### Visual Studio Code

```sh
code --install-extension stylelint.vscode-stylelint
```

#### Ignore

```scss
.foo {
  /* stylelint-disable */
  color: red;
  /* stylelint-enable */
}
```

```scss
.foo {
  color: red !important; /* stylelint-disable-line declaration-no-important */
}
```

```scss
.foo {
  /* stylelint-disable-next-line declaration-no-important */
  color: red !important;
}
```
