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

#### NPM

```sh
npm install @tailwindcss/jit tailwindcss postcss autoprefixer --save-dev
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
  content: ['./src/**/*.{ts,tsx}'],
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
cat << EOF > ./src/styles/main.css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  h1 {
    @apply mt-24 text-5xl px-6 font-extrabold tracking-tight;
  }
}
EOF
```

### Usage

```sh
#
npm run start
```

### Tips

#### Visual Studio Code

```sh
code \
  --install-extension bradlc.vscode-tailwindcss \
  --install-extension heybourn.headwind
```

<!-- ####

"tailwindCSS.includeLanguages": {
  "plaintext": "html"
}, -->
