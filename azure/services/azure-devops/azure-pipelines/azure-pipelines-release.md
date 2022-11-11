# Azure Pipelines Release

## CLI

### Commands

```sh
az pipelines release -h
```

### Usage

```sh
#
az pipelines release definition list -p '<project-name>'

#
az pipelines release definition show \
  --name '<definition-name>' \
  -p '<project-name>'

#
az pipelines release list -p '<project-name>'

#
az pipelines release create \
  --definition-name '<name>'
  -p '<project-name>'

#
az pipelines release show \
  --id <release-id> \
  -p <project-name>
```
