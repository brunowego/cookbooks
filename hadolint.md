# Haskell Dockerfile Linter (hadolint)

## CLI

### Installation

#### Homebrew

```sh
brew install hadolint
```

### Tips

#### Visual Studio Code

```sh
code --install-extension exiasr.hadolint
```

### Ignore

```Dockerfile
# hadolint ignore=DL3013
RUN pip install /usr/src/packages/[package-version].tar.gz
```
