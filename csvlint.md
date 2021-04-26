# csvlint

## CLI

### Installation

#### go get

```sh
go get github.com/Clever/csvlint/cmd/csvlint
```

### Commands

```sh
csvlint -help
```

### Usage

```sh
#
csvlint ./[filename].csv

#
csvlint \
  --lazyquotes \
  ./[filename].csv

#
csvlint \
  --delimiter='\t' \
  ./[filename].csv
```
