# OpenVPN Community Edition (CE)

<!--
https://github.com/bertrandmartel/vpn-http-proxy
https://github.com/flant/ovpn-admin
-->

<!--
https://artifacthub.io/packages/helm/cloudnativeapp/openvpn
https://github.com/suda/charts/tree/main/charts/personal-ovpn
https://www.udemy.com/course/servidor-openvpn/
-->

## Links

- [Code Repository](https://github.com/OpenVPN/openvpn)
- [Main Website](https://openvpn.net/)
- [Community](https://openvpn.net/community/)

## CLI

### Installation

#### Homebrew

```sh
brew install openvpn
```

#### Chocolatey

```sh
choco install -y openvpn
```

### Services

```sh
# Homebrew
brew services start openvpn
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension idleberg.openvpn

#
jq '."recommendations" += ["idleberg.openvpn"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
