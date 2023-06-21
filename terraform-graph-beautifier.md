# Terraform Graph Beautifier

## Links

- [Code Repository](https://github.com/pcasteran/terraform-graph-beautifier)

## CLI

### Installation

```sh
GOBIN=/usr/local/bin go install github.com/pcasteran/terraform-graph-beautifier@latest
```

### Commands

```sh
terraform-graph-beautifier -h
```

#### Usage

```sh
#
terraform graph | terraform-graph-beautifier --output-type=cyto-html > ./index.html
```
