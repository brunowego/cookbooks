# Visual Studio Code Remote Development

## References

- [Remote Development using SSH](https://code.visualstudio.com/docs/remote/ssh)

## Extension

### Installation

```sh
#
code --install-extension ms-vscode-remote.vscode-remote-extensionpack

#
jq '."recommendations" += ["ms-vscode-remote.vscode-remote-extensionpack"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## Configuration

<!-- ```sh
cat << EOF >> ~/.ssh/config
Host [hostname]
  RemoteCommand zsh -l
  RequestTTY force
EOF
``` -->

1. View -> Command Palette...
2. Remote-SSH: Connect to Host...

## Logs

1. View -> Output Tab
2. Select: Remote - SSH
