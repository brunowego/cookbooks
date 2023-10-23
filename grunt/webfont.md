# Grunt Webfont

<!--
{,*/}*
-->

## Library

### References

- [Webfont](/webfont.md#configuration)

### Dependencies

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

Install [distutils](/python/distutils.md)
