# Surge

## CLI

### NPM

```sh
npm install surge -g
```

### Usage

```sh
export DEPLOY_DOMAIN=
export SURGE_TOKEN=

surge \
  --project ./dist \
  --domain "$DEPLOY_DOMAIN" \
  --token "$SURGE_TOKEN"
```
