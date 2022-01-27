# Tailwind CSS

<!--
https://twind.dev/
https://github.com/MathiasGilson/tailwind-styled-component
-->

**Keywords:** CSS framework

## Links

- [Code Repository](https://github.com/tailwindlabs/tailwindcss)
- [Main Website](https://tailwindcss.com/)
- [Docs](https://tailwindcss.com/docs)
- [Tailwind UI](https://tailwindui.com/)
- [Headless UI](https://headlessui.dev/react/menu)
- [Heroicons](https://heroicons.com/)
- [CodePen Examples](https://codepen.io/search/pens?q=tailwind)

## Docs

- [Configuration](https://tailwindcss.com/docs/configuration)
- [Just-in-Time Mode](https://tailwindcss.com/docs/just-in-time-mode)

## Success Cases

- [Himalayas](https://himalayas.app/)
- [PlanetScale](https://planetscale.com/)
- [Supabase](https://supabase.io/)

<!--
https://panelbear.com/
https://sprig.com/
-->

## Useful

- [Figma Kit for TailwindCSS](https://github.com/ecklf/tailwindcss-figma-kit)

## CLI

### Commands

```sh
npx tailwindcss -h
```

### Installation

#### NPM or Yarn

```sh
# Using NPM
npm install @tailwindcss/jit tailwindcss postcss autoprefixer --save-dev

# Using Yarn
yarn add @tailwindcss/jit tailwindcss postcss autoprefixer --dev
```

### Bootstrap

```sh
#
cat << EOF > ./postcss.config.js
const postcssConfig = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}

module.exports = postcssConfig
EOF
```

<!-- #
mv ./postcss.config.js ./postcss.config.mjs

#
cat << EOF > ./postcss.config.mjs
import tailwind from 'tailwindcss'
import tailwindConfig from './tailwind.config.mjs'
import autoprefixer from 'autoprefixer'

const postcssConfig = {
  plugins: [tailwind(tailwindConfig), autoprefixer],
}

export default postcssConfig
EOF -->

```sh
#
npx tailwindcss init

#
mv ./tailwind.config.js ./tailwind.config.cjs

cat << EOF > ./tailwind.config.cjs
const tailwindConfig = {
  mode: 'jit',
  content: [
    './src/components/**/*.{ts,tsx}',
    './src/pages/**/*.{ts,tsx}'
  ],
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}

module.exports = tailwindConfig
EOF

#
cat << EOF > ./src/styles/globals.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF
```

### Usage

```sh
# Using NPM
npm run dev

# Using Yarn
yarn dev
```

### Tips

#### Vercel Ignore

**Docs:** [Ignored Files and Folders](https://vercel.com/docs/concepts/deployments/build-step#ignored-files-and-folders)

```sh
echo '!/tailwind.config.cjs' >  ./.vercelignore
```

#### Visual Studio Code

```sh
code \
  --install-extension bradlc.vscode-tailwindcss \
  --install-extension heybourn.headwind

# For HTML
jq '."tailwindCSS.includeLanguages".plaintext |= "html"' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"

# For Typescript
jq '."tailwindCSS.includeLanguages".typescript |= "javascript"' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"

jq '."tailwindCSS.includeLanguages".typescriptreact |= "javascript"' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"
```

### Issues

#### Miss Content Configuration

```log
warn - No utilities were generated there is likely a problem with the `content` key in the tailwind config. For more information see the documentation: https://tailwindcss.com/docs/content-configuration
```

Change `'./src/**/*.{ts,tsx}'` to `'./src/pages/**/*.{ts,tsx}'`.
