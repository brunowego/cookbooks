# Windows Subsystem for Linux (WSL)

## References

- [Code Repository](https://github.com/microsoft/wslg)
- [Main Website](https://aka.ms/wsl)
- [Developing in WSL](https://code.visualstudio.com/docs/remote/wsl)

## CLI

<!-- ### Installation

#### Chocolatey

```sh
choco install -y wsl2
``` -->

### Usage

```sh
#
wsl --list --online

#
wsl --install
wsl --install <name>

#
wsl --status
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ms-vscode-remote.remote-wsl

#
jq '."recommendations" += ["ms-vscode-remote.remote-wsl"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
