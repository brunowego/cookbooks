# Yarn

## CLI

### Installation

#### Homebrew

```sh
brew install yarn
```

#### APT

```sh
sudo apt update
sudo apt -y install yarn
```

#### YUM

```sh
curl -Ls https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
```

```sh
yum check-update
sudo yum -y install yarn
```

#### Chocolatey

```sh
choco install -y yarn
```

### Configuration

```sh
# Save Prefix
yarn config set save-prefix false

# Git ignore
echo 'yarn-error.log' >> ~/.gitignore_global
```

### Commands

```sh
yarn -h
```

### Tips

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 yarn\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```
