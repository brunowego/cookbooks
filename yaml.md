# YAML Ain't Markup Language (YAML)

## Links

- [YAML Spec](https://yaml.org/spec/1.2/spec.html#id2795688)
- [YAML Lint](http://yamllint.com)

## Tools

- [YAMLlint](/yamllint.md)

## Guides

- [YAML Multiline](https://yaml-multiline.info/)

## Key Concepts

- YAML isn't a markup language
- Programming language for data serialization
- Easily read by humans
- Easily parsed by machines
- File extensions: `.yml` or `.yaml`
- Formatting
  - Indentation
  - Colons
  - Dashes

## Tips

### Visual Studio Code

```sh
#
code --install-extension redhat.vscode-yaml

#
jq '."recommendations" += ["redhat.vscode-yaml"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```

### Merge Key Language

[_Documentation_](http://yaml.org/type/merge.html)

```yaml
---
projects:
  - &shared
    name: app-stg
    workflow: default

  - <<: *shared
    name: app-prd
```

### Block Styles

[_Documentation_](https://yaml.org/spec/1.2/spec.html#Block)

```yaml
---
literal: |
  some
  text

folded: >
  some
  text
```
