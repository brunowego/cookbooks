# Poppler

**Keywords:** Merge PDF, Separate PDF

## Links

- [Main Website](https://poppler.freedesktop.org/)

## CLI

### Installation

#### Homebrew

```sh
brew install poppler
```

### Commands

```sh
pdfunite -h
pdfseparate -h
```

### Usage

```sh
#
pdfunite ./in.pdf ./in.pdf ./in.pdf ./out.pdf

#
pdfseparate ./<filename>.pdf %d.pdf
```
