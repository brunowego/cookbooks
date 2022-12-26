# Visual Studio Code Project Manager

## Installation

```sh
#
code --install-extension alefragnani.project-manager

#
jq '."recommendations" += ["alefragnani.project-manager"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!--
~/Library/Application\ Support/Code/User/globalStorage/alefragnani.project-manager/projects.json
-->
