# Tailwind CSS

<!--
https://twind.dev/
https://github.com/MathiasGilson/tailwind-styled-component

mui
flowbite
-->

**Keywords:** CSS framework

<!-- TODO: Lint not working with VS Code -->

## Links

- [Code Repository](https://github.com/tailwindlabs/tailwindcss)
- [Main Website](https://tailwindcss.com)
- [Docs](https://tailwindcss.com/docs)
- [Tailwind UI](https://tailwindui.com)
- [Headless UI](https://headlessui.dev/react/menu)
- [Heroicons](https://heroicons.com)
- [CodePen Examples](https://codepen.io/search/pens?q=tailwind)

## Docs

- [Configuration](https://tailwindcss.com/docs/configuration)
- [Just-in-Time Mode](https://tailwindcss.com/docs/just-in-time-mode)

## Success Cases

- [Himalayas](https://himalayas.app/)
- [PlanetScale](https://planetscale.com)
- [Supabase](https://supabase.io/)

<!--
https://betterstack.com/
https://panelbear.com/
https://sprig.com/
https://splitbee.io/
https://kontist.com/
https://fnatic.com/
https://flipsidecrypto.xyz/
https://coastpay.com/
https://stint.co/
https://hellolanding.com/
https://metafy.gg/
https://hellonext.co/
https://snapshot.org/

https://flipsidecrypto.xyz/
https://app.splitbee.io/
https://planetscale.com/
https://metafy.gg/
https://snapshot.org/
https://coinbase.com/price/torn
https://zapper.fi/
https://datamish.com/

https://betterstack.com/better-uptime
https://appsignal.com/
-->

## Useful

- [Figma Kit for TailwindCSS](https://github.com/ecklf/tailwindcss-figma-kit)

## CLI

### Commands

```sh
# Using NPX
npx tailwindcss -h
```

### Usage

**Tip:** Verify if exists parameter `"type": "module"` in `package.json`.

```sh
#
npx tailwindcss init -fp

#
tailwindcss \
  --input ./input.css \
  --output ./output.css \
  --watch
```

## Library

### Installation

```sh
# Using NPM
npm install @types/tailwindcss tailwindcss postcss autoprefixer --save-dev

# Using Yarn
yarn add @types/tailwindcss tailwindcss postcss autoprefixer --dev
```

### Bootstrap

**Refer:** `./postcss.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const postcssConfig = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}

module.exports = postcssConfig
```

**Refer:** `./tailwind.config.cjs`

```cjs
/**
 * @type { import('tailwindcss').Config }
 */
const tailwindConfig = {
  content: ['./src/components/**/*.{ts,tsx}', './src/pages/**/*.{ts,tsx}'],
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}

module.exports = tailwindConfig
```

**Refer:** `./src/styles/globals.css`

```css
@tailwind base;
/* @tailwind components; */
/* @tailwind utilities; */
```

### Tips

<!-- #### Vercel Ignore

**Docs:** [Ignored Files and Folders](https://vercel.com/docs/concepts/deployments/build-step#ignored-files-and-folders)

```sh
echo '!/tailwind.config.cjs' > ./.vercelignore
``` -->

#### Visual Studio Code

- [Code Repository](https://github.com/tailwindlabs/tailwindcss-intellisense)

**Features:** Autocomplete, Linting and Hover Preview.

```sh
#
code --install-extension bradlc.vscode-tailwindcss

#
jq '."recommendations" += ["bradlc.vscode-tailwindcss"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
jq '."files.associations"."*.css" |= "tailwindcss"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

### Issues

#### Missing PostCSS VSCode Extension

```log
Unknown at rule @tailwind css(unknownAtRules)
```

Just install [Visual Studio Code Extension](/postcss.md#visual-studio-code).

#### TBD

```log
The `content` option in your Tailwind CSS configuration is missing or empty.
Configure your content sources or your generated CSS will be missing styles.
https://tailwindcss.com/docs/content-configuration
```

TODO

#### Missing Custom Classname Whitelist

```log
Classname 'text-primary-900' is not a Tailwind CSS class! eslint tailwindcss/no-custom-classname
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  rules: {
    // ...
    'tailwindcss/no-custom-classname': [
      'warn',
      {
        whitelist: ['(bg|text)\\-primary\\-([1-9]0|5)0'],
      },
    ],
  },
}

module.exports = eslintRC
```

#### Invalid Classnames Order

```log
Invalid Tailwind CSS classnames order eslint tailwindcss/classnames-order
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  rules: {
    // ...
    'tailwindcss/classnames-order': 'off',
  },
}

module.exports = eslintRC
```

#### Miss Content Configuration

```log
warn - No utilities were generated there is likely a problem with the `content` key in the tailwind config. For more information see the documentation: https://tailwindcss.com/docs/content-configuration
```

Change `'./src/**/*.{ts,tsx}'` to `'./src/pages/**/*.{ts,tsx}'`.
