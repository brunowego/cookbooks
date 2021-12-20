# Favorite Icon (Favicon)

<!--
https://github.com/tailwindlabs/tailwindcss.com/tree/master/public/favicons
-->

## Markup HTML

```html
<!-- Icon -->
<link rel="icon" type="image/x-icon"  href="/favicon.ico" />

<!-- PNG: https://caniuse.com/link-icon-png  -->
<link rel="icon" type="image/png" href="/favicon.png" />

<!-- Prefers Color Scheme -->
<link rel="shortcut icon" type="image/png" href="/favicon-light.png" media="(prefers-color-scheme: no-preference)">
<link rel="shortcut icon" type="image/png" href="/favicon-dark.png" media="(prefers-color-scheme: dark)">
<link rel="shortcut icon" type="image/png" href="/favicon-light.png" media="(prefers-color-scheme: light)">
```

## Tips

### PNG to ICO

**Dependencies:** [ImageMagick](/imagemagick.md)

```sh
convert \
  -resize x64 \
  -gravity center \
  -crop 64x64+0+0 \
  ./image.png \
  -flatten \
  -colors 256 \
  -background transparent \
  ./favicon.ico
```
