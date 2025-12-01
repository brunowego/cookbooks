# MuPDF

## Links

- [Code Repository](https://github.com/ArtifexSoftware/mupdf.js)
- [Main Website](https://mupdf.com)

## CLI

### Installation

```sh
# Using Homebrew
brew install mupdf
```

### Commands

```sh
mutool -h
```

### Usage

```
mutool info Plans_Pt_2.pdf

mutool info Plans_Pt_2.pdf

mutool draw -o "$(basename Plans_Pt_2.pdf .pdf)_thumb.png" -w 800 -h 800 Plans_Pt_2.pdf 1

mutool draw -o "$(basename Plans_Pt_2.pdf .pdf)_page_%03d.png" -w 800 -h 800 Plans_Pt_2.pdf

mutool clean -p 5-10 Plans_Pt_2.pdf Plans_Pt_2_5-10.pdf
```

## Library

### Issues

#### TBD

```log
Aborted(Error: ENOENT: no such file or directory, open '/_next/static/media/mupdf-wasm.da4d69c0.wasm'). Build with -sASSERTIONS for more info.
```

<!--
https://github.com/ArtifexSoftware/mupdf.js/issues/147

https://github.com/search?q=path%3Anext.config.+content%3Amupdf&type=code&p=2

serverExternalPackages: ['mupdf'],
-->

TODO
