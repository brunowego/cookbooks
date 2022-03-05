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
echo '/node_modules' >> ./.gitignore
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
#
npx yarn create [app]

#
npx yarn pack

#
npx yarn global bin

#
npx yarn upgrade --latest
```

### Tips

#### Visual Studio Code

##### Search Exclusion

```sh
jq '."search.exclude"."yarn.lock" |= true' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"

# For Yarn Berry
jq '."search.exclude".".yarn" |= true' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"
```

##### Recommended Extensions

```sh
code \
  --install-extension codezombiech.gitignore \
  --install-extension sidneys1.gitconfig
```

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

### Issues

#### TBD

```log
➤ YN0000: ┌ Resolution step
➤ YN0002: │ eslint-plugin-tailwindcss@npm:3.5.0 doesn't provide autoprefixer (p90605), requested by tailwindcss
➤ YN0000: │ Some peer dependencies are incorrectly met; run yarn explain peer-requirements <hash> for details, where <hash> is the six-letter p-prefixed code
```

```sh
yarn explain peer-requirements
yarn explain peer-requirements [hash]
```

TODO
