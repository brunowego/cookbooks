# Grunt Webfont

<!--
{,*/}*
-->

## Library

### References

- [Webfont](/webfont.md#configuration)

### Installation

#### Homebrew

```sh
brew install ttfautohint fontforge
```

#### APT

```sh
sudo apt update
sudo apt -y install ttfautohint fontforge
```

## Issues

### Missing distutils

```log
ModuleNotFoundError: No module named 'distutils.spawn'
```

```sh
# APT
sudo apt -y install python3-distutils
```
