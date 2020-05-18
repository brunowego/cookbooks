# Commands

## References

- [Find syntax](https://en.wikipedia.org/wiki/Find_(Unix)#Find_syntax)

## Commands

```sh
man find
```

## Examples

### Kill Process

```sh
pkill find
```

### Wildcard

```sh
find . -name \*.[extension]
```

###

```sh
find . -type f -exec /bin/sh -c 'echo "{}"' \;
find . -exec /bin/sh -c {}/"${name}" \;
```

### Move all files from subfolders to parent folder

```sh
find . -mindepth 2 -type f -print -exec mv {} . \;
```
