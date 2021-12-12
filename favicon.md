# Favorite Icon (Favicon)

<!--
https://github.com/tailwindlabs/tailwindcss.com/tree/master/public/favicons
-->

## Markup HTML

```html
<link rel="icon" type="image/png" href="/favicon.png" />
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
