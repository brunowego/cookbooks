# Yarn

**Keywords:** Node.js Package Manager

## CLI

### Installation

**Note:** Use `npx yarn` instead of install it.

#### NPM

```sh
npm install -g yarn
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

### Bootstrap

```sh
#
yarn init -y; yarn

#
yarn init -yp; yarn
```

### Configuration

**Warning:** Before continue check the currently version, running `yarn --version`.

```sh
#
yarn policies set-version 3.5.1

#
yarn -v

# Git ignore
echo '/yarn-error.log' >> ~/.gitignore_global
```

#### For Version 1.x

**Reference:** [Configuration](https://classic.yarnpkg.com/en/docs/configuration)

**Tips:** Configurations are store ind `~/.yarnrc`.

```sh
#
yarn config list

# Save Prefix
yarn config set save-prefix '~'

# License
yarn config set init-license 'MIT'
yarn config set init-license 'UNLICENSED'
yarn config set init-license 'COPYRIGHT'
```

#### For Version >= 2.x

**Reference:** [Configuration](https://yarnpkg.com/configuration/yarnrc)

**Tips:** Configurations are store ind `~/.yarnrc.yml`.

```sh
#
yarn config

# Save Prefix
yarn config set --home defaultSemverRangePrefix '~'

# Telemetry
yarn config set --home enableTelemetry 0

#
yarn config set --home nodeLinker 'node-modules'

# License
# TODO
```

### Commands

```sh
# Using NPX
npx yarn -h

# Using Local
yarn -h
```

### Usage

```sh
#
yarn install

#
yarn create <app>

#
yarn pack

# Using Yarn 1.x
yarn global bin # show bin path
yarn global list # show globally installed packages

# Using Yarn >= 2.x
# TODO

#
yarn up -R '**'

#
yarn dev
yarn --cwd ./<path/to/package> dev
```

<!--
#
yarn upgrade --latest
yarn upgrade-interactive --latest
-->

<!--
yarn --cwd `yarn global dir` list

yarn info --recursive --dependents
-->

### Tips

#### Package Manager

```sh
#
yarn -v
```

**Refer:** `./package.json`

```json
{
  // ...
  "packageManager": "yarn@3.5.1"
}
```

#### Get Binary Path

```sh
yarn bin <command>
```

#### Add Type Module

**Refer:** `./package.json`

```json
{
  // ...
  "type": "module"
  // ...
}
```

#### Visual Studio Code

##### Search Exclusion

```sh
jq '."search.exclude"."yarn.lock" |= true' "$PWD"/.vscode/settings.json | \
  sponge "$PWD"/.vscode/settings.json

# For Yarn Berry
jq '."search.exclude".".yarn" |= true' "$PWD"/.vscode/settings.json | \
  sponge "$PWD"/.vscode/settings.json
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

#### Existence of a `package.json` in a directory above

```log
Usage Error: The nearest package directory (/path/to/repo) doesn't seem to be part of the project declared in /path/to/repo.
```

There is a `package.json` in some parent directory above the current directory.

#### Enable Immutable Installs

```log
#10 2.438 ➤ YN0028: │ The lockfile would have been modified by this install, which is explicitly forbidden.
```

```sh
yarn config --why

yarn config get enableImmutableInstalls
```

#### Un-updated Lockfile

```log
error Your lockfile needs to be updated, but yarn was run with `--frozen-lockfile`.
```

```sh
# Yarn <= v1
yarn check --integrity
```

#### Missing Yarn Module

```log
Error: Cannot find module '/path/to/.yarn/releases/yarn-3.2.0.cjs'
```

```sh
#
rm ./.yarnrc.yml

#
yarn install
```

#### Invalid Checksum

```log
➤ YN0018: │ gluegun@https://github.com/edgeandnode/gluegun.git#commit=b34b9003d7bf556836da41b57ef36eb21570620a: The remote archive doesn't match the expected checksum
```

```sh
#
yarn cache clean --all

#
YARN_CHECKSUM_BEHAVIOR=update yarn install
```

#### TBD

```log
➤ YN0000: ┌ Resolution step
➤ YN0002: │ eslint-plugin-tailwindcss@npm:3.5.0 doesn't provide autoprefixer (p90605), requested by tailwindcss
➤ YN0000: │ Some peer dependencies are incorrectly met; run yarn explain peer-requirements <hash> for details, where <hash> is the six-letter p-prefixed code
```

```sh
#
yarn explain peer-requirements
yarn explain peer-requirements <hash>
```

TODO

<!-- ## Dockerfile

```Dockerfile
FROM docker.io/library/node:18.12-alpine

WORKDIR /usr/src/app

COPY ./package.json ./yarn.lock ./

RUN yarn install && \
      yarn cache clean

COPY ./ ./

RUN yarn build

EXPOSE 3000

CMD ["yarn", "build"]
``` -->
