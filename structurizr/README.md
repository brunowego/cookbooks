# Structurizr

<!--
workspace.dsl
structurizr.properties
-->

<!--
Could you propose me an architecture of Internet Banking System in Structurizr DSL?
Could you propose me an architecture of Enterprise Resource Planning System in Structurizr DSL?
-->

**Keywords:** C4 model, Docs as Code

## Links

- [Mail Website](https://structurizr.com)
- [Org Repository](https://github.com/structurizr)
- [DSL](https://structurizr.com/dsl)
  - [Code Repository](https://github.com/structurizr/dsl)
  - [Help](https://structurizr.com/help/dsl)
  - [Language Reference](https://github.com/structurizr/dsl/blob/master/docs/language-reference.md)
- [Examples](https://github.com/structurizr/examples/tree/main/dsl)

<!--
https://dev.to/simonbrown/getting-started-with-the-structurizr-cli-10c2
-->

## Glossary

- Domain-Specific Language (DSL)

## Support Exports

- PNG/SVG
- PlantUML
- Mermaid
- Kroki

## CLI

### Links

- [Code Repository](https://github.com/structurizr/cli)

### Installation

#### Homebrew

```sh
brew install structurizr-cli

#
ln -s /usr/local/bin/structurizr-cli /usr/local/bin/structurizr
```

### Commands

```sh
#
structurizr help
```

### Usage

```sh
#
structurizr validate -w ./workspace.dsl

#
structurizr list -w ./workspace.dsl

#
structurizr export -w ./workspace.dsl -format plantuml
```

### Issues

#### Unsupported Java Version

```log
The Structurizr CLI does not work with Java versions 11.0.0-11.0.3 - please upgrade your Java installation
```

```sh
#
java -version

#
jabba install openjdk@1.15.0
jabba use openjdk@1.15.0
jabba current
```

## Tips

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.dsl]
indent_size = 4

EOF
```

### Visual Studio Code

**Info:** Syntax highlighting extension.

```sh
#
code --install-extension systemticks.c4-dsl-extension

#
jq '."recommendations" += ["systemticks.c4-dsl-extension"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### Alternartive

```sh
#
code --install-extension ciarant.vscode-structurizr

#
jq '."recommendations" += ["ciarant.vscode-structurizr"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
