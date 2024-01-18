# typescript-eslint

## Links

- [Main Website](https://typescript-eslint.io)

## Library

### Installation

```sh
# Using pnpm
pnpm add @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint typescript -D
```

### Configuration

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  overrides: [
    {
      extends: ['plugin:@typescript-eslint/recommended'],
      plugins: ['@typescript-eslint'],
      files: ['*.ts?(x)'],
      rules: {
        '@typescript-eslint/consistent-type-imports': 'error',
      },
    },
  ],
}

module.exports = eslintRC
```
