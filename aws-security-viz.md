# aws-security-viz

<!--
NOTES:
works with rbenv
-->

## Links

- [Code Repository](https://github.com/anaynayak/aws-security-viz)

## CLI

### Dependencies

- [Graphviz](/graphviz.md)

### Installation

#### RubyGems

```sh
gem install aws_security_viz
```

### Commands

```sh
aws_security_viz -h
```

### Environment

**Dependency:** [alias](/shell/alias.md)

```sh
echo "alias asv='aws_security_viz'" >> ~/.aliases

source ~/.zshrc
```

### Usage

```sh
#
export AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id)"
export AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key)"

#
asv \
  -a "$AWS_ACCESS_KEY_ID" \
  -s "$AWS_SECRET_ACCESS_KEY" \
  --color=true

open ./aws-security-viz.png
```
