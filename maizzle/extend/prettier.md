# Prettier

**Dependencies:** [Library](/prettier.md#library)

## Configuration

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...
  tailwindConfig: './tailwind.config.cjs',
}

module.exports = prettierConfig
```
