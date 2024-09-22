# Python

<!--
https://linkedin.com/learning/building-tools-with-python/building-tools-with-python
https://linkedin.com/learning/python-essential-training-2018/welcome
https://linkedin.com/learning/data-science-foundations-data-mining-in-python/python-for-data-mining
-->

## Links

- [Python Cheat-Sheet](https://github.com/gto76/python-cheatsheet)
- Docs
  - [Versions](https://python.org/doc/versions)

## Version

- [Python 2.x](/python/python2.md)
- [Python 3.x](/python/python3.md)

## Isolated Python Environments

- [Pipenv](/pipenv.md)
- [Virtualenv](/virtualenv.md)
- [Poetry](/poetry.md)

<!--
https://github.com/conda/conda
-->

## Tips

### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.py]
indent_size = 4
EOF
```

### Visual Studio Code

**_Dependencies_**: [Pylint](/pylint.md)

```sh
#
code --install-extension ms-python.python

#
jq '."recommendations" += ["ms-python.python"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

```sh
#
code --install-extension ms-python.vscode-pylance

#
jq '."recommendations" += ["ms-python.vscode-pylance"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json

#
jq '."python.languageServer" |= "Pylance"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
# jq '."python.showStartPage" |= false' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
