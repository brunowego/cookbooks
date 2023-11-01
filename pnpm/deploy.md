# pnpm deploy

## Commands

```sh
pnpm deploy -h
```

## Usage

```sh
#
pnpm deploy ./pruned \
  -P \
  --filter @<owner>/<name>
```

## Issues

### Hoisted Node Linker

```log
 WARN  EXDEV: cross-device link not permitted, rename '/app/node_modules/turbo/node_modules' -> '/app/node_modules/_tmp_25_3dfb9f783ec7a6cd9da85874ed8c3261/node_modules'
Falling back to copying packages from store
 EXDEV  EXDEV: cross-device link not permitted, rename '/app/node_modules/turbo/node_modules' -> '/app/node_modules/_tmp_25_aaba111825cf3e347af35cfc4e3208ea/node_modules'
```

Error happen when `node-linker` is set to `hoisted`.

```sh
#
pnpm config set --local node-linker 'hoisted'

#
pnpm install
```
