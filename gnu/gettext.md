# GNU gettext

**Keywords:** Portable Object

<!--
pospell
pofilter
po-lint
-->

## Links

- [Main Website](https://gnu.org/software/gettext/)

## CLI

### Installation

```sh
# Using Homebrew
brew install gettext

# Using APT
sudo apt update
sudo apt -y install gettext libgettextpo-dev

# Using YUM
sudo yum check update
sudo yum -y install gettext-devel

# Using APK
apk update
apk add gettext gettext-dev
```

### Commands

```sh
gettext -h
```

### Usage

```sh
#
xgettext -D ./src/pages -o ./src/locales/en-US.po
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension mrorz.language-gettext

#
jq '."recommendations" += ["mrorz.language-gettext"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
