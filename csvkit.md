# csvkit

**Keywords:** CSV Toolkit

## Links

- [Code Repository](https://github.com/wireservice/csvkit)

## CLI

### Installation

```sh
# Using Homebrew
brew install csvkit
```

### Commands

```sh
csvstack -h
```

### Tips

#### Merge TSV files

```sh
csvstack -t ./<file1>.tsv ./<file2>.tsv > ./<output>.csv
```

### Issues

#### TBD

```log
Your file is not "utf-8-sig" encoded. Please specify the correct encoding with the --encoding flag. Use the -v flag to see the complete error.
```

<!--
--encoding utf-8-sig
-->

<!--
file file1.tsv file2.tsv

# 2024.tsv: Unicode text, UTF-16, little-endian text, with CRLF line terminators

# For UTF-16 files

iconv -f UTF-16 -t UTF-8 file1.tsv > file1_utf8.tsv
iconv -f UTF-16 -t UTF-8 file2.tsv > file2_utf8.tsv
-->

TODO
