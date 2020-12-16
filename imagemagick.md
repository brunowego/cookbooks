# ImageMagick

## CLI

### Installation

#### Homebrew

```sh
brew install imagemagick
```

### Usage

```sh
convert -help
```

### Usage

```sh
# Favicon
convert \
  -thumbnail 32x32 \
  -alpha on \
  -background none \
  -flatten \
  ./favicon.png ./favicon.ico
```
