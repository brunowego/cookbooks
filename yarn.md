# Yarn

## Installation

### Homebrew

```sh
brew install yarn
```

### APT

```sh
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

```sh
sudo apt update
sudo apt -y install yarn
```

### YUM

```sh
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
```

```sh
sudo yum check-update
sudo yum -y install yarn
```

### Chocolatey

```sh
choco install -y yarn
```

## Commands

```sh
yarn --help
```
