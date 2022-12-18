# Apktool

## Links

- [Code Repository](https://github.com/iBotPeaches/Apktool)
- [Main Website](https://ibotpeaches.github.io/Apktool/)

## Terms

- Obfuscate Smali

## CLI

**Note:** Avoid `-dirty` suffix in version number.

### Installation

#### Homebrew

```sh
brew install apktool
```

#### Linux Binary

```sh
# version: 2.7.0
wget -nvO /usr/local/bin/apktool https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool && \
  chmod +x /usr/local/bin/apktool && \
    wget -nvO /usr/local/bin/apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.7.0.jar

# Only if not exists in PATH
export PATH="$PATH:/usr/local/bin"
```

> Wait! This process take a while.

#### APT

```sh
sudo apt update
sudo apt -y install apktool
```

**Warning:** Avoid dirty version:

```sh
#
apktool --version

#
sudo apt -y purge apktool
```

### Commands

```sh
apktool
```

<!-- ### Usage

```sh
#
apktool
``` -->
