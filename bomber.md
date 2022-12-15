# bomber

**Keywords:** SCA, SBOM

## Links

- [Code Repository](https://github.com/devops-kung-fu/bomber)

## Glossary

- Open Source Vulnerabilities (OSV)
- Software Bill of Materials (SBOM)
- Software Package Data Exchange (SPDX)

## CLI

### Installation

#### Homebrew

```sh
brew tap devops-kung-fu/homebrew-tap
brew install bomber
```

### Commands

```sh
bomber -h
```

### Usage

```sh
#
bomber scan cyclonedx.sbom.json

#
bomber scan bad-bom.json --output=html

#
bomber scan \
  --provider=xxx \
  --username=xxx \
  --token=xxx \
  spdx-sbom.json
```

<!-- ### Tips -->

<!-- #### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# bomber
source <(bomber completion zsh) # bash
```

```sh
source ~/.zshrc
``` -->
