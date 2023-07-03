# Haskell Dockerfile Linter (hadolint)

## Links

- [Code Repository](https://github.com/hadolint/hadolint)

## CLI

### Installation

#### Homebrew

```sh
# 2.12.0
brew install hadolint
```

#### Darwin Binary

```sh
curl \
  -L "https://github.com/hadolint/hadolint/releases/download/$(curl -s https://api.github.com/repos/hadolint/hadolint/releases/latest | grep tag_name | cut -d '"' -f 4)/hadolint-Darwin-x86_64" \
  -o /usr/local/bin/hadolint && \
    chmod +x /usr/local/bin/hadolint
```

#### Linux Binary

```sh
sudo curl \
  -L "https://github.com/hadolint/hadolint/releases/download/$(curl -s https://api.github.com/repos/hadolint/hadolint/releases/latest | grep tag_name | cut -d '"' -f 4)/hadolint-Linux-x86_64" \
  -o /usr/local/bin/hadolint && \
    sudo chmod +x /usr/local/bin/hadolint
```

### Commands

```sh
hadolint --help
```

### Tips

#### pre-commit

```yml
---
repos:
  - repo: https://github.com/hadolint/hadolint
    rev: v2.7.0
    hooks:
      - id: hadolint
        stages: <commit>
```

#### Visual Studio Code

```sh
#
code --install-extension exiasr.hadolint

#
jq '."recommendations" += ["exiasr.hadolint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
jq ".\"hadolint.hadolintPath\" |= \"$(which hadolint)\"" "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

#### Ignore

```Dockerfile
# hadolint ignore=DL3013
RUN pip3 install /usr/src/packages/<package-version>.tar.gz
```

### Issues

#### TBD

```log
[1]    5029 segmentation fault  hadolint --help
```

TODO

#### Deprecated Maintainer

```sh
[hadolint] error: MAINTAINER is deprecatedDL4000
```

```Dockerfile
LABEL maintainer="John Doe <johndoe@xyz.tld>"
```

<!--
if command -v docker >/dev/null; then
  npm run lint:docker
fi
-->

## Docker

### Running

```sh
#
docker run -i --rm docker.io/hadolint/hadolint:2.12.0 < ./Dockerfile
```
