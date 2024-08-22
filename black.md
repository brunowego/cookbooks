# Black

## Links

- [Code Repository](https://github.com/psf/black)
- [Main Website](https://black.readthedocs.io/en/stable/index.html)

<!-- ##

```sh
cat << EOF > ./black.toml
[tool.black]
line-length = 140
target-version = ['py38']
EOF
``` -->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ms-python.black-formatter

#
jq '."recommendations" += ["ms-python.black-formatter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json

#
jq '."[python]"."editor.formatOnSave" |= true' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json

jq '."[python]"."editor.defaultFormatter" |= "ms-python.black-formatter"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

#### pre-commit

```yml
---
repos:
  - repo: https://github.com/ambv/black
    rev: 21.9b0
    hooks:
      - id: black
        language_version: python3.9
        stages: [commit]
```
