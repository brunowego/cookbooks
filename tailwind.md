# Tailwind CSS

**Keywords:** CSS framework

<!--
https://desenvolvimentoparaweb.com/css/tailwind-css/
https://www.youtube.com/watch?v=mO3aXUgjnIE
https://app.pluralsight.com/library/courses/ng-conf-2021-session-23/table-of-contents
https://github.com/temporalio/temporaldotio/blob/main/tailwind.config.js
https://github.com/ecklf/tailwindcss-figma-kit
-->

## Links

- [Code Repository](https://github.com/tailwindlabs/tailwindcss)
- [Main Website](https://tailwindcss.com/)
- [Docs](https://tailwindcss.com/docs)
- [Tailwind UI](https://tailwindui.com/)
- [CodePen Examples](https://codepen.io/search/pens?q=tailwind)

## Docs

- [Just-in-Time Mode](https://tailwindcss.com/docs/just-in-time-mode)

## Success Cases

- [Himalayas](https://himalayas.app/)
- [PlanetScale](https://planetscale.com/)

## CLI

### Installation

#### NPM

```sh
npm install @tailwindcss/jit tailwindcss postcss --save-dev
```

### Commands

```sh
npx tailwindcss -h
```

### Initialize

```sh
#
npx tailwindcss init -p
```

### Configuration

```sh
# Git Ignore
echo '/node_modules' >> ./.gitignore

#
mkdir -p ./src
touch ./src/styles.css
```

Alter `./tailwind.config.js`:

```js
module.exports = {
  mode: 'jit',
  purge: [
    './public/**/*.html',
  ],
  // ...
```

Alter `./package.json`:

```json
{
  // ...
  "scripts": {
    "start": "tailwindcss -i ./src/styles.css -o ./build/css/styles.css --watch"
  },
  // ...
}
```

### Usage

```sh
#
npx tailwindcss \
  -o ./build/css/styles.css \
  --watch

# Or
npm run start
```

### Custom Styles

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  h1 {
    @apply mt-24 text-5xl px-6 font-extrabold tracking-tight;
  }
}
```

### Tips

#### Visual Studio Code

```sh
code --install-extension bradlc.vscode-tailwindcss
```
