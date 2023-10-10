# AWS CloudFormation (CF)

<!--
DependsOn Attribute
Wait Condition
-->

**Keywords:** Infrastructure as Code

## Alternatives

- [Terraform](/hashicorp/terraform/README.md)
- [Pulumi](/pulumi.md)
- [Ansible](/ansible.md)

## Links

- Console
  - [CloudFormation / Stacks](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks?filteringStatus=active&filteringText=&viewNested=true&hideStacks=false)

## Guides

- [Troubleshooting CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html)

## Tools

- [AWS CloudFormation Linter (cnf-lint)](/cfn-lint.md)

## CLI

### Commands

```sh
aws cloudformation help
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension aws-scripting-guy.cform

#
jq '."recommendations" += ["aws-scripting-guy.cform"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Solution

### Terminology

- **Stack:** A collection of resources to deploy as a group
- **Template:** A JSON or YAML file that describes the stack
- **Change Set:** Preview how proposed changes will impact running resources
- **Stackset:** Create, update, delete stacks across multiple accounts and regions
- **Nested Stacks:** Stacks creates as part of other stacks

### [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)

```yml
---
AWSTemplateFormatVersion: 2010-09-09

Description: >-
  My awesome description.

Metadata: {}

Parameters: {}

Mappings: {}

Conditions: {}

Transform: {}

Resources: {}

Outputs: {}
```
