# Bazel

## CLI

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install curl gnupg
```

### Installation

#### Homebrew

```sh
brew install bazel
```

#### APT

```sh
echo 'deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8' | sudo tee /etc/apt/sources.list.d/bazel.list
curl -fsSL https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
```

```sh
sudo apt update
sudo apt -y install bazel
```

#### YUM

```sh
yum check-update
sudo yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/vbatts/bazel/repo/epel-7/vbatts-bazel-epel-7.repo
sudo yum -y install bazel
```

### Commands

```sh
bazel info
```

### Tips

#### Visual Studio Code

```sh
code --install-extension devondcarew.bazel-code
```
