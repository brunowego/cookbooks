# Pulumi

<!--
https://app.pluralsight.com/library/courses/pulumi-getting-started/table-of-contents

https://github.com/Mobiauto/sre-interview-boilerplate
-->

**Keywords:** Infrastructure as Code

## Links

- [Code Repository](https://github.com/pulumi/pulumi)
- [Main Website](https://pulumi.com)

## Guides

- [Get Started](https://www.pulumi.com/get-started/)
- [Pulumi vs. Other Solutions](https://www.pulumi.com/docs/intro/vs/)

## CLI

### Installation

#### Homebrew

```sh
brew install pulumi
```

### Commands

```sh
pulumi -h
```

### Usage

```sh
#
pulumi export > ./export.json

#
pulumi stack import \
  --file ./export.json
```
