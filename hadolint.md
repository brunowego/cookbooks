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

#### Visual Studio Code

```sh
#
code --install-extension exiasr.hadolint

#
jq ".\"hadolint.hadolintPath\" |= \"$(which hadolint)\"" "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

### Ignore

```Dockerfile
# hadolint ignore=DL3013
RUN pip3 install /usr/src/packages/[package-version].tar.gz
```
