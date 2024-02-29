# Tailwind CSS

<!--
Style Guide

https://styleguidefortailwind.com
https://github.com/garygreen/tsg
https://github.com/mattbrailsford/tailwind-style-guide
-->

<!--
Colors

https://github.com/medusajs/medusa/blob/develop/www/docs/tailwind.config.js
-->

<!--
https://github.com/search?q=path%3Apackage.json%20content%3Anext%20content%3Atailwindcss&type=code
-->

<!--
https://tailbits.com
-->

**Keywords:** CSS framework, Utility-first

<!-- TODO: Lint not working with VS Code -->

## Links

- [Code Repository](https://github.com/tailwindlabs/tailwindcss)
- [Main Website](https://tailwindcss.com)
- [Docs](https://tailwindcss.com/docs)
- [Tailwind Play](https://play.tailwindcss.com)
- Examples
  - [CodePen](https://codepen.io/search/pens?q=tailwind)

## Docs

- [Configuration](https://tailwindcss.com/docs/configuration)
- [Just-in-Time Mode](https://tailwindcss.com/docs/just-in-time-mode)

## Success Cases

- [Himalayas](https://himalayas.app)
- [PlanetScale](https://planetscale.com)
- [Supabase](https://supabase.io)

<!-- ## UI Kit -->

## UI Components

- [daisyUI](https://daisyui.com)
- [Flowbite](/flowbite.md)
- [Headless UI](/headlessui.md) 🌟
- [HyperUI](https://hyperui.dev)
- [Myna UI](https://mynaui.com)
- [Preline](https://preline.co)
- [Sail UI](https://sailui.github.io/ui)
- [Tailwind UI](https://tailwindui.com)

## Useful

- [Figma Kit for TailwindCSS](https://github.com/ecklf/tailwindcss-figma-kit)

## Tools

- [Tailwind Gradient Generator](https://tailwind-gradient-generator.vercel.app)
- Converter
  - [Lembdadev / CSS to TailwindCSS Converter](https://lembdadev.com/css-to-tailwind-converter)
  - [Transform / CSS to TailwindCSS](https://transform.tools/css-to-tailwind)
  - [TailwindCSS Converter / Convert Css To Tailwind](https://tailwind-converter.netlify.app)
- [DivMagic](/divmagic.md)
- [Tailwind Color Palette](https://tailwindcolor.com)
- [tailwindpdf](/tailwindpdf.md)

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

# Using pnpm
pnpm add @types/tailwindcss tailwindcss postcss autoprefixer -D
```

### Bootstrap

**Refer:** `./postcss.config.cjs`

```cjs
/**
 * @type { import('postcss').ProcessOptions }
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

<!-- ####

```ts
screens: Object.fromEntries(
  Object.entries(defaultTheme.screens).filter(([key]) => key !== '2xl'),
),

screens: Object.fromEntries(
  Object.entries(defaultTheme.screens).filter(([key]) =>
    ['sm', 'md'].includes(key),
  ),
),
``` -->

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

- Option 1: Install [Tailwind CSS Extension](#visual-studio-code)
- Option 2: Install [PostCSS Visual Extension](/postcss.md#visual-studio-code)

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

<!--
import type { Config } from 'tailwindcss'

const config: Pick<Config, "content" | "presets"> = {
  presets: [
    {
      content: [
        // ...
      ],
    },
  ],
}

export default config
-->
