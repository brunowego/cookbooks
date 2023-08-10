# GNU gettext

**Keywords:** Portable Object

## Links

- [Main Website](https://gnu.org/software/gettext/)

## CLI

### Installation

#### Homebrew

```sh
brew install gettext
```

#### APT

```sh
sudo apt update
sudo apt -y install gettext libgettextpo-dev
```

#### YUM

```sh
sudo yum check update
sudo yum -y install gettext-devel
```

#### APK

```sh
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
