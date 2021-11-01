# Hugo

<!--
https://martijnvanvreeden.nl/10-ways-to-improve-your-hugo-website-performance/
-->

## Links

- [Code Repository](https://github.com/gohugoio/hugo)
- [Main Website](https://gohugo.io/)
- [Themes](https://themes.gohugo.io/)

## Guides

- [Front Matter](https://gohugo.io/content-management/front-matter/)
- [Hugo's Lookup Order](https://gohugo.io/templates/lookup-order/)

## CLI

### Installation

#### Homebrew

```sh
brew install hugo
```

#### APT

```sh
sudo apt update
sudo apt -y install hugo
```

#### Chocolatey

```sh
choco install hugo
```

### Commands

```sh
hugo -h
```

### Usage

```sh
#
hugo new site [name] && cd "$_"

#
hugo new theme [name]

#
hugo new [page.md]
hugo new [section]/[page.md]

#
hugo serve
hugo serve -D --cleanDestinationDir

#
hugo --minify
```

### Tips

#### Download Theme

```sh
#
git clone 'https://github.com/EmielH/tale-hugo.git' ./themes/tale

#
cat << EOF | tee -a ./config.toml
theme = 'tale'
EOF

#
hugo --minify
```
