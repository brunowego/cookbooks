# Scalable Vector Graphics (SVG)

## Tools

- [URL-encoder for SVG](https://yoksel.github.io/url-encoder/)
- [SVG to Data URI converter](https://codepen.io/elliz/details/ygvgay)

## Tools

- [SVG Artista](https://svgartista.net)

## Tips

### Visual Studio Code

```sh
#
code --install-extension SimonSiefke.svg-preview

#
jq '."recommendations" += ["SimonSiefke.svg-preview"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Code

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
