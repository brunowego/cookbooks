# eXecute Npm Package Binaries (NPX)

## CLI

### Installation

#### NPM

```sh
npm install npx -g
```

### Commands

```sh
npx -h
npm help exec
```

### Tips

#### Registry

```sh
#
npm_config_registry=[] \
  npx [package]

# or
npx --userconfig ~/.npmrc-[vendor] [package]
```
