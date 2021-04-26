# Scalable Vector Graphics (SVG)

## Tools

- [URL-encoder for SVG](https://yoksel.github.io/url-encoder/)
- [SVG to Data URI converter](https://codepen.io/elliz/details/ygvgay)

## Tips

#### Visual Studio Code

```sh
code --install-extension SimonSiefke.svg-preview
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
