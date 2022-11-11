# PHP Graphics Library (GD, originally stood for "GIF Draw")

**Keyword:** `ext-gd`

<!-- ## References

- [PECL Package](https://pecl.php.net/package/gd) -->

## Dependencies

- [GD](/gd.md)

<!--
- [zlib](/zlib.md)
- [libjpeg](/libjpeg.md)
- [libpng](/libpng.md)
- [freetype](/freetype.md)
- [WebP](/webp.md)
-->

## Installation

<!-- ### PECL

```sh
pecl install gd
``` -->

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  gd \
  -- \
    --with-jpeg

# Linux
phpbrew -d ext install \
  --downloader=wget \
  gd \
  -- \
    --with-freetype-dir=/usr/include/freetype2
```

<!--
    --with-zlib-dir=$(brew --prefix zlib) \
    --with-jpeg-dir=$(brew --prefix libjpeg) \
    --with-png-dir=$(brew --prefix libpng) \
    --with-freetype-dir=$(brew --prefix freetype) \
    --with-webp-dir==$(brew --prefix webp)
-->

## Verify

```sh
#
php -m | grep gd

#
php -i | grep '^gd$' -A 15
```

## Issues

### Missing JPEG

```log
Error: Call to undefined function App\Helper\imagejpeg()
```

```sh
phpbrew -d ext install \
  --downloader=wget \
  gd \
  -- \
    --with-jpeg
```
