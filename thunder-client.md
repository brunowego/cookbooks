# Thunder Client

<!--
https://www.youtube.com/watch?v=AbCTlemwZ1k
-->

## Tips

### Visual Studio Code

```sh
#
code --install-extension rangav.vscode-thunder-client

#
jq '."recommendations" += ["rangav.vscode-thunder-client"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
