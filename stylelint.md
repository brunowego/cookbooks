# stylelint

<!--
stylelint-config-tailwindcss
-->

## Links

- [Code Repository](https://github.com/stylelint/stylelint)
- [Main Website](https://stylelint.io/)
- [List of rules](https://stylelint.io/user-guide/rules/list)

## Library

### Installation

```sh
# Using NPM
npm install stylelint stylelint-config-recommended stylelint-order --save-dev

# Using Yarn
yarn add stylelint stylelint-config-recommended stylelint-order --dev
```

### Configuration

**Refer:** `./.stylelintrc.cjs`

```cjs
/**
 * @type { import('stylelint').Config }
 */
const stylelintRC = {
  extends: 'stylelint-config-recommended',
  plugins: ['stylelint-order'],
  rules: {
    'string-quotes': 'single',
    'order/properties-alphabetical-order': true,
  },
}

module.exports = stylelintRC
```

```sh
#
echo '!/.stylelintrc.cjs' >> ./.eslintignore
```

<!-- ### Extend -->

<!-- #### With Prettier

**Dependencies:** [Prettier](/prettier.md#library)

```sh
# Using NPM
npm install stylelint-config-prettier stylelint-prettier --save-dev

# Using Yarn
yarn add stylelint-config-prettier stylelint-prettier --dev
```

**Refer:** `./.stylelintrc.cjs`

```cjs
/**
 * @type { import('stylelint').Config }
 */
const stylelintRC = {
  // ...
  plugins: [
    // ...
    'stylelint-prettier',
  ],
  rules: {
    // ...
    'prettier/prettier': true,
  },
  // ...
}

module.exports = stylelintRC
``` -->

<!-- #### With SCSS

```sh
# Using NPM
npm install stylelint-scss --save-dev

# Using Yarn
yarn add stylelint-scss --dev
```

**Refer:** `./.stylelintrc.cjs`

```cjs
/**
 * @type { import('stylelint').Config }
 */
const stylelintRC = {
  // ...
  plugins: [
    // ...
    'stylelint-scss',
  ],
  // ...
}

module.exports = stylelintRC
``` -->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension stylelint.vscode-stylelint

#
jq '."recommendations" += ["stylelint.vscode-stylelint"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"

#
jq '."stylelint.validate" += ["tailwindcss"]' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"
```

#### Ignore Rules for TailwindCSS

```log
Unexpected unknown at-rule "@tailwind" (at-rule-no-unknown) Stylelintat-rule-no-unknown
```

**Refer:** `./.stylelintrc.cjs`

```cjs
/**
 * @type { import('stylelint').Config }
 */
const stylelintRC = {
  // ...
  rules: {
    // ...
    'at-rule-no-unknown': [
      true,
      {
        ignoreAtRules: ['tailwind'],
      },
    ],
    'function-no-unknown': [
      true,
      {
        ignoreFunctions: ['theme'],
      },
    ],
  },
}

module.exports = stylelintRC
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
