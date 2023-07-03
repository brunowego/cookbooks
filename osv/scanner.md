# OSV Scanner

**Keywords:** SBOM

## Links

- [Code Repository](https://github.com/google/osv-scanner)

## CLI

### Installation

#### go get

```sh
GOBIN=/usr/local/bin go install github.com/google/osv-scanner/cmd/osv-scanner@v1
```

### Commands

```sh
osv-scanner -h
```

### Usage

```sh
#
osv-scanner --docker docker.io/library/ubuntu:20.04

#
osv-scanner --sbom ./sbom.json
```
