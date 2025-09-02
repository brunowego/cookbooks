# pngquant

<!--
zopfli
oxipng
-->

**Keywords:** PNG Compression, PNG Optimization

## Links

- [Code Repository](https://github.com/kornelski/pngquant)
- [Main Website](https://pngquant.org)

## CLI

### Installation

```sh
# Using Homebrew
brew install pngquant
```

### Commands

```sh
pngquant -h
```

### Usage

```sh
#
pngquant \
  --quality=70-80 \
  --ext .png \
  --force \
  --skip-if-larger \
  ./*.png

#
find . -name '*.png' -exec pngquant --quality=70-80 --ext .png --force --skip-if-larger {} \;
```
