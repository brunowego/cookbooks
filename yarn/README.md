# Yarn

## CLI

### Installation

**Note:** Use `npx yarn` instead of install it.

#### NPM

```sh
npm install -g yarn
```

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
#
curl -Ls 'https://dl.yarnpkg.com/rpm/yarn.repo' | \
  sudo tee '/etc/yum.repos.d/yarn.repo'

#
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
npx yarn init -y; npx yarn

#
npx yarn init -yp; npx yarn
```

### Configuration

```sh
# Save Prefix
npx yarn config set save-prefix '~'

# License
npx yarn config set init-license 'MIT'
npx yarn config set init-license 'UNLICENSED'
npx yarn config set init-license 'COPYRIGHT'

# Git ignore
echo '/yarn-error.log' >> ~/.gitignore_global

#
cat ~/.yarnrc
```

### Commands

```sh
npx yarn -h
```

### Usage

```sh
# Nextjs
npx yarn create next-app

#
npx yarn pack

#
npx yarn global bin
```

### Tips

#### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
cat << EOF >> ./.gitattributes
/yarn.lock -diff
/yarn.lock linguist-generated=true
EOF
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 yarn\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```
