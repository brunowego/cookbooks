# Next.js + Prettier

## Dependencies

- [Prettier](/prettier.md#library)

## Configuration

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type {import('prettier').Options}
 */
const prettierConfig = {
  semi: false,
  singleQuote: true,
  jsxSingleQuote: false,
}

module.exports = prettierConfig
```
