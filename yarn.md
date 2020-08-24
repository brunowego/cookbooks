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
curl -Ls 'https://dl.yarnpkg.com/rpm/yarn.repo' | \
  sudo tee '/etc/yum.repos.d/yarn.repo'
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
echo '/node_modules' > ./.gitignore
```

### Bootstrap

```sh
#
yarn init -y; yarn

#
yarn init -yp; yarn
```

### Configuration

```sh
# Save Prefix
yarn config set save-prefix '~'

# License
yarn config set init-license 'MIT'
yarn config set init-license 'UNLICENSED'

# Git ignore
echo '/yarn-error.log' >> ~/.gitignore_global
```

### Commands

```sh
yarn -h
```

### Usage

```sh
# Nextjs
yarn create next-app

#
yarn pack
```

### Tips

#### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
cat << EOF >> ./.gitattributes
yarn.lock -diff
yarn.lock linguist-generated=true
EOF
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 yarn\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```
