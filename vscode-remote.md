# Visual Studio Code - Remote Development

## References

- [Remote Development using SSH](https://code.visualstudio.com/docs/remote/ssh)

## Extension

### Installation

```sh
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
```

## Configuration

```sh
cat << EOF >> ~/.ssh/config
Host [hostname]
  RemoteCommand zsh -l
  RequestTTY force
EOF
```

1. View -> Command Palette...
2. Remote-SSH: Connect to Host...
