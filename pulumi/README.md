# Pulumi

<!--
https://app.pluralsight.com/library/courses/pulumi-getting-started

https://github.com/worldzhy/newbie/tree/main
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
brew tap pulumi/tap
brew install pulumi
```

### Configuration

```sh
#
pulumi login
pulumi login --local

#
pulumi whoami -v

#
pulumi org set-default <org>

#
pulumi logout
```

### Commands

```sh
pulumi -h
```

### Usage

```sh
#
pulumi plugin ls

#
pulumi up
```

<!--
pulumi stack init <name>

pulumi stack ls
pulumi stack select <name>

pulumi new aws-typescript

pulumi export > ./export.json

pulumi stack import \
  --file ./export.json

pulumi plugin install resource aws
-->
