# Ghostscript

## CLI

### Installation

#### Homebrew

```sh
brew install gs
```

### Usage

```sh
gs \
  -o repaired.pdf \
  -sDEVICE=pdfwrite \
  -dPDFSETTINGS=/prepress \
  corrupted.pdf
```
