# terraform-plantuml (tfpuml)

## Links

- [Code Repository](https://github.com/fmalk/terraform-plantuml)

## CLI

### Installation

```sh
# Using npm
npm install tfpuml -g
```

### Commands

```sh
tfpuml -h
```

### Configuration

```sh
#
tfpuml-download-plantuml
```

### Usage

```sh
#
terraform state pull > ./terraform.tfstate

#
tfpuml --no-check ./terraform.tfstate ./output.puml
```
