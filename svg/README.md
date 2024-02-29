# Scalable Vector Graphics (SVG)

## Tools

- [URL-encoder for SVG](https://yoksel.github.io/url-encoder/)
- [SVG to Data URI converter](https://codepen.io/elliz/details/ygvgay)

## Tools

- [SVG Artista](https://svgartista.net)
- [SVG Minifier](https://svgminify.com)

## Tips

### Visual Studio Code

```sh
#
code --install-extension SimonSiefke.svg-preview

#
jq '."recommendations" += ["SimonSiefke.svg-preview"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Snippets

### HTML

```html
<svg
  name="arrow-down-icon"
  height="16"
  width="16"
  class="icon icon-arrow-down-icon"
>
  <use xlink:href="#arrow-down-icon"></use>
</svg>
```

<!-- ###

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64"><style>@media (prefers-color-scheme:dark){.ring{fill:#fff}}</style><path fill="#101010" d="M32 0c17.673 0 32 14.327 32 32 0 9.739-4.35 18.462-11.214 24.33l-.209.178a.483.483 0 0 1-.73-.13l-4.635-8.11a.678.678 0 0 1 .086-.792l.025-.026A21.693 21.693 0 0 0 53.76 32c0-12.018-9.742-21.76-21.76-21.76S10.24 19.982 10.24 32a21.69 21.69 0 0 0 6.254 15.266l.171.172.03.03a.64.64 0 0 1 .108.774l-4.63 8.102a.515.515 0 0 1-.756.158l-.024-.02C4.426 50.613 0 41.824 0 32 0 14.327 14.327 0 32 0z" class="ring"/><path fill="#fbbf24" d="M33.276 32.34c.398.227.729.557.956.956l15.349 26.857a2.57 2.57 0 0 1-2.856 3.77l-14.102-3.525a2.572 2.572 0 0 0-1.247 0l-14.101 3.525a2.571 2.571 0 0 1-2.856-3.77l15.348-26.857a2.571 2.571 0 0 1 3.509-.957z"/></svg>
``` -->
