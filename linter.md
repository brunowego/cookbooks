# Linter

## Links

- [Code Repository](https://github.com/fnando/vscode-linter)

## Supported Linters

- Brakeman (Ruby)
- Credo (Elixir)
- Dart
- ESLint (JavaScript)
- hadolint (Dockerfile)
- LanguageTool
- Luacheck (Lua)
- markdownlint (Markdown)
- PHP CodeSniffer
- proselint (Prose)
- pylint (Python)
- Reek (Ruby)
- RuboCop (Ruby)
- Ruby
- shellcheck (Shell Script)
- sqlfluff (SQL)
- stylelint (CSS)
- swiftlint (Swift)
- textlint
- Vale (Prose)
- yamllint (YAML)

## Visual Studio Code

```sh
#
code --install-extension fnando.linter

#
jq '."recommendations" += ["fnando.linter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
