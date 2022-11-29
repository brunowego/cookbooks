# HashiCorp Packer

<!--
https://linkedin.com/learning/learning-hashicorp-packer/stop-manually-creating-images-and-start-using-packer
-->

## CLI

### Installation

#### Homebrew

```sh
brew install packer
```

### APT

```sh
sudo apt update
sudo apt -y install packer
```

### YUM

```sh
yum check-update
sudo yum -y install packer
```

### Chocolatey

```sh
choco install -y packer
```

### Commands

```sh
packer --help
```

### Usage

```sh
#
packer build ./script.json
```

### Tips

#### Visual Studio Code

```sh
# Install
#
code --install-extension 4ops.packer

#
jq '."recommendations" += ["4ops.packer"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
