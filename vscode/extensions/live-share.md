# Visual Studio Code Live Share

<!--
https://code.visualstudio.com/learn/collaboration/live-share
-->

## Links

- [Main Website](https://visualstudio.microsoft.com/services/live-share/)

## Extension

### Installation

```sh
#
code --install-extension MS-vsliveshare.vsliveshare

#
jq '."recommendations" += ["MS-vsliveshare.vsliveshare"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```