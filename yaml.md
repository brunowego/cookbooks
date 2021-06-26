# YAML Ain't Markup Language (YAML)

## Links

- [YAML Spec](https://yaml.org/spec/1.2/spec.html#id2795688)

## Tools

- [YAMLlint](/yamllint.md)

## Guides

- [YAML Multiline](https://yaml-multiline.info/)

## Tips

### Visual Studio Code

```sh
code --install-extension redhat.vscode-yaml
```

### Merge Key Language

[*Documentation*](http://yaml.org/type/merge.html)

```yaml
projects:
- &shared
  name: app-stg
  workflow: default

- <<: *shared
  name: app-prd
```

### Block Styles

[*Documentation*](https://yaml.org/spec/1.2/spec.html#Block)

```yaml
literal: |
  some
  text

folded: >
  some
  text
```
