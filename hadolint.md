# Haskell Dockerfile Linter (hadolint)

## CLI

### Installation

#### Homebrew

```sh
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

### Tips

#### pre-commit

```yaml
---
repos:
  - repo: https://github.com/hadolint/hadolint
    rev: v2.7.0
    hooks:
      - id: hadolint
        stages: [commit]
```

#### Visual Studio Code

```sh
#
code --install-extension exiasr.hadolint

#
jq ".\"hadolint.hadolintPath\" |= \"$(which hadolint)\"" "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

### Ignore

```Dockerfile
# hadolint ignore=DL3013
RUN pip3 install /usr/src/packages/[package-version].tar.gz
```

### Issues

#### Deprecated Maintainer

```sh
[hadolint] error: MAINTAINER is deprecatedDL4000
```

```Dockerfile
LABEL maintainer="John Doe <johndoe@example.com>"
```
