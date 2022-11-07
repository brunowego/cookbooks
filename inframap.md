# InfraMap

**Keyword:** Terraform Graph

## Links

- [Code Repository](https://github.com/cycloidio/inframap)

## Alternative

- [Terraform Graph](/hashicorp/terraform/terraform-graph.md)

## CLI

### Dependencies

- [Graphviz](/graphviz.md)

### Installation

#### Homebrew

```sh
brew install inframap
```

### Commands

```sh
inframap -h
```

### Usage

```sh
#
inframap generate \
  --tfstate ./terraform.tfstate | \
    dot -Tpng > ./graph.png

#
inframap generate ./modules/<name>/main.tf | \
  dot -Tpng > ./graph.png
```

#### Remotely

```sh
#
terraform state pull | \
  inframap generate | \
    dot -Tpng > ./graph.png

#
aws s3 cp s3://path/to/terraform.tfstate - | \
  inframap generate | \
    dot -Tpng > ./graph.png

#
az storage fs file download \
  --account-name <storage> \
  --file-system <container> \
  --path terraform.tfstate \
  --destination /dev/stdout | \
    inframap generate | \
      dot -Tpng > ./graph.png
```

<!--
gsutil cat gs://path/to/terraform.tfstate | \
  inframap generate | \
    dot -Tpng > ./graph.png
-->
