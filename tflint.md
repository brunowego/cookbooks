# TFLint

**Keywords:** Terraform Linter

## Links

- [Main Website](https://github.com/terraform-linters/tflint)

## CLI

### Installation

#### Homebrew

```sh
brew install tflint
```

#### Chocolatey

```sh
choco install tflint
```

### Commands

```sh
tflint -h
```

### Usage

```sh
#
TFLINT_LOG=debug tflint
```

### Tips

#### Visual Studio Code

**Configuration:**

```sh
#
jq '."files.associations"."*.hcl" |= "terraform"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

#### HCL Configuration

**Refer:** `./.tflint.hcl`

```hcl
rule "terraform_workspace_remote" {
  enabled = false
}
```
