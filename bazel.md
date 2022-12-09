# Bazel

<!--
https://www.youtube.com/watch?v=mXLrk0ipwz4
-->

## Links

- [Code Repository](https://github.com/bazelbuild/bazel/)
- [Main Website](https://bazel.build/)

## CLI

### Dependencies

- Linux
  - [cURL](/curl.md)
  - [GNU Privacy Guard (GPG) or GNU Pretty Good Privacy (PGP)](/gnu-pg.md)

### Installation

#### Homebrew

```sh
brew install bazel
```

#### APT

```sh
echo 'deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8' | sudo tee /etc/apt/sources.list.d/bazel.list
curl -fsSL https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

sudo apt update
sudo apt -y install bazel
```

#### YUM

```sh
sudo yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/vbatts/bazel/repo/epel-7/vbatts-bazel-epel-7.repo

yum check-update
sudo yum -y install bazel
```

### Commands

```sh
bazel info
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension devondcarew.bazel-code

#
jq '."recommendations" += ["devondcarew.bazel-code"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
