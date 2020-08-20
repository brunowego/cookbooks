# Grunt Webfont

## Library

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

<!--
{,*/}*
-->

### Configuration

Add [text rules](/gitattributes.md#text)

```sh
echo '*.woff binary\n' >> ./.gitattributes
```
