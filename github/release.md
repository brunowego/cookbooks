# GitHub Release

## CLI

### Links

- [Manual](https://cli.github.com/manual/gh_release_create)

### Dependencies

- [GitHub](/github/README.md#cli)

### Commands

```sh
gh release create -h
```

### Usage

```sh
#
tar -czvf ./dist.tgz ./dist

#
gh release create "$(date -u '+%Y.%m.%d-%H%M')" ./dist.tgz
```
