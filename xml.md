# Extensible Markup Language (XML)

## Syntax

### Tips

#### Visual Studio Code

```sh
#
code --install-extension redhat.vscode-xml

#
jq '."recommendations" += ["redhat.vscode-xml"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.xml]
indent_size = 4
max_line_length = 100

EOF
```
