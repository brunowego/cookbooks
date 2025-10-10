# Ghostscript

## CLI

### Installation

```sh
# Using Homebrew
brew install ghostscript
```

### Commands

```sh
gs -h
```

### Usage

```sh
#
gs \
  -o repaired.pdf \
  -sDEVICE=pdfwrite \
  -dPDFSETTINGS=/prepress \
  corrupted.pdf
```
