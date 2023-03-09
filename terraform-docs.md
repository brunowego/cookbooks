# terraform-docs

## Links

- [Code Repository](https://github.com/terraform-docs/terraform-docs/)
- [Main Website](https://terraform-docs.io)

## CLI

### Installation

#### Homebrew

```sh
brew install terraform-docs
```

#### Chocolatey

```sh
choco install terraform-docs
```

### Commands

```sh
terraform-docs -h
```

### Configuration

**Refer:** `./.terraform-docs.yml`

```yml
---
formatter: markdown table
output:
  file: ./README.md
  mode: inject
  template: |-
    <!-- BEGIN_TF_DOCS -->
    {{ .Content }}
    <!-- END_TF_DOCS -->
sort:
  enabled: true
  by: required
content: |-
  {{ .Inputs }}
  {{ .Outputs }}
settings:
  indent: 4
  escape: false
  default: false
  required: false
  type: true
```
