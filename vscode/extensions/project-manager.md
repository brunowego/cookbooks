# Visual Studio Code Project Manager

## Installation

```sh
#
code --install-extension alefragnani.project-manager

#
jq '."recommendations" += ["alefragnani.project-manager"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Tips

### Backup

```sh
#
cat ~/Library/Application\ Support/Code/User/globalStorage/alefragnani.project-manager/projects.json | gh gist create - -f vscode-project-manager

#
# TODO
```
