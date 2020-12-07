# Ghostscript

## CLI

### Installation

#### Homebrew

```sh
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
