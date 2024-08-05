# Scalable Vector Graphics (SVG)

## Tools

- [SVG Artista](https://svgartista.net)
- [SVG Minifier](https://svgminify.com)
- [SVG to Data URI converter](https://codepen.io/elliz/details/ygvgay)
- [URL-encoder for SVG](https://yoksel.github.io/url-encoder/)

### Browser

- [SVG Export](https://chromewebstore.google.com/detail/svg-export/naeaaedieihlkmdajjefioajbbdbdjgp)

## Tips

### Visual Studio Code

```sh
#
code --install-extension SimonSiefke.svg-preview

#
jq '."recommendations" += ["SimonSiefke.svg-preview"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Dark Theme

```svg
<svg
  // ..
  >
  <style>@media (prefers-color-scheme:dark){.a{fill:#fff}}</style>

  <path
    // ..
    class="a"
    fill="#000"
  />
</svg>
```

## Snippets

### HTML

```html
<svg
  class="icon icon-arrow-down-icon"
  name="arrow-down-icon"
  width="16"
  height="16"
>
  <use xlink:href="#arrow-down-icon"></use>
</svg>
```

## Issues

### TBD

```log
Cannot find module '../../static/img/any.svg' or its corresponding type declarations. ts(2307)
```

**Refer:** `./src/.d.ts`

```ts
declare module '*.svg' {
  const content: string | StaticImport

  export default content
}
```

<!--
declare module '*.svg' {
  const content: React.FunctionComponent<React.SVGAttributes<SVGElement>>

  export default content
}
-->

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "include": ["src/.d.ts" /* ... */]
}
```
