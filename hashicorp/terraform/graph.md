# Terraform Graph

## Links

- [Docs](https://developer.hashicorp.com/terraform/cli/commands/graph)

## Dependencies

- [Graphviz](/graphviz.md)

## Usage

```sh
#
terraform graph

#
terraform graph -type=plan | dot -Tpng > ./graph.png
terraform graph -type=plan | dot -Tsvg > ./graph.png
```
