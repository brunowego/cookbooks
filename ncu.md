# npm-check-updates (ncu)

<!--
yarn upgrade-interactive
-->

## CLI

### Installation

```sh
# Using NPM
npm install npm-check-updates -g
```

### Commands

```sh
ncu -h
```

### Usage

```sh
#
ncu -ui

#
ncu --deep -ui

#
npx npm-check-updates -ui --packageFile ./apps/web/package.json
```

## Library

### Configuration

```sh
cat << EOF ./.ncurc.yml
upgrade: true
# reject:
#   - package-name
EOF
```
