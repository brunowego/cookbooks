# jscpd

**Keywords:** Copy/paste Detector

## Links

- [Code Repository](https://github.com/kucherenko/jscpd)

## CLI

### Commands

```sh
npx jscpd -h
```

### Usage

```sh
#
npx jscpd ./src
```

### Issues

#### TBD

```log
FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
```

<!--
https://github.com/kucherenko/jscpd/issues/417
https://github.com/kucherenko/jscpd/issues/715
-->

<!--
pnpm add @jscpd/leveldb-store jscpd -D
npx jscpd --store leveldb ./
-->

```sh
npx jscpd ./ \
  -z 8192 \
  -i "**/dist/**,**/node_modules/**" \
  -f json,markdown,ts,tsx,yaml
```
