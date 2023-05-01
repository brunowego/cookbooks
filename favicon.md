# Favorite Icon (Favicon)

<!--
https://github.com/tailwindlabs/tailwindcss.com/tree/master/public/favicons

Sizes: 32x32, 48x48
Bit depth: 32 bits (16.7M colors & alpha transparency)

https://icon.horse
-->

## Tools

- [Favicon checker](https://realfavicongenerator.net/favicon_checker)
- [favicon.io / Converter](https://favicon.io/favicon-converter/)
- [ICO converter](https://icoconverter.com) 🌟

## Examples

- [Google](https://google.com/favicon.ico)
- [Facebook](https://facebook.com/favicon.ico)
- [GitHub](https://github.com/favicon.ico)

## Markup HTML

```html
<!-- Icon -->
<link rel="icon" type="image/x-icon" href="/favicon.ico" />

<!-- PNG: https://caniuse.com/link-icon-png  -->
<link rel="icon" type="image/png" href="/favicon.png" />

<!-- SVG+XML -->
<link rel="icon" type="image/svg+xml" href="/favicon.svg" />

<!-- Prefers Color Scheme -->
<link
  rel="shortcut icon"
  type="image/png"
  href="/favicon-dark.png"
  media="(prefers-color-scheme: dark)"
/>
<link
  rel="shortcut icon"
  type="image/png"
  href="/favicon.png"
  media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)"
/>
```

## Tips

### PNG to ICO

**Dependencies:** [ImageMagick](/imagemagick.md)

```sh
#
convert \
  -resize x32 \
  -gravity center \
  -crop 32x32+0+0 \
  ./favicon.png \
  -flatten \
  -colors 256 \
  -background transparent \
  ./favicon.ico

#
convert ./favicon.png \
  -background white \
  \( -clone 0 -resize 32x32 -extent 32x32 \) \
  -delete 0 \
  -alpha off \
  -colors 16 \
  ./favicon.ico
```
