# Extensible Markup Language (XML)

## Syntax

### Tips

#### Visual Studio Code

```sh
code --install-extension redhat.vscode-xml
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension redhat.vscode-xml
```

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.xml]
indent_size = 4
max_line_length = 100

EOF
```
