# Just-in-Time Mode

**Docs:** [Just-in-Time Mode](https://v2.tailwindcss.com/docs/just-in-time-mode)

## Installation

```sh
# Using NPM
npm install @tailwindcss/jit --save-dev

# Using Yarn
yarn add @tailwindcss/jit --dev
```

## Configuration

**Refer:** `./tailwind.config.cjs`

```cjs
/**
 * @type { import('tailwindcss').Config }
 */
const tailwindConfig = {
  mode: 'jit',
  // ...
}

module.exports = tailwindConfig
```
