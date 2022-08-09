# fswatch

## Links

- [Code Repository](https://github.com/emcrisostomo/fswatch)

## CLI

### Installation

#### Homebrew

```sh
brew install fswatch
```

### Commands

```sh
fswatch -h
```

### Usage

```sh
#
fswatch -o ~/path/to/watch | xargs -n1 -I{} ~/script/to/run/when/files/change.sh
```

### Tips

#### Image Bright

```sh
#
cat << \EOF > ~/.scripts/convert.sh
#! /bin/sh

find . -name '*.png' | while read fname; do
  convert -brightness-contrast 5x1 "$fname" ../"$fname"; rm "$fname"
done
EOF

#
chmod +x ~/.scripts/convert.sh

#
fswatch -o ~/Dropover/TradingView/unprocessed | xargs -n1 -I{} ~/.scripts/convert.sh
```
