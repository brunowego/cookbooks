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
ncu -u

#
ncu --deep -u
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
