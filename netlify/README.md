# Netlify

<!--
https://www.youtube.com/watch?v=vLgdmMekdIE

https://app.pluralsight.com/guides/deploy-a-react-app-on-a-server
-->

## Links

- [Main Website](https://netlify.com)
- [Status Page](https://netlifystatus.com)

## Plugins

- [Netlify Plugin Lighthouse](https://github.com/netlify-labs/netlify-plugin-lighthouse)

## CLI

### Installation

#### Homebrew

```sh
brew install netlify-cli
```

### Commands

```sh
netlify help
```

### Usage

```sh
#
netlify login
```

<!--
netlify deploy
-->

<!--
```sh
cat << EOF > ./netlify.toml
[build]
  publish = "out"
  command = "npm run build-prod"
EOF
```
-->
