# Commands

## References

- [Find syntax](https://en.wikipedia.org/wiki/Find_(Unix)#Find_syntax)

## Commands

```sh
man find
```

## Usage

```sh
# Kill Process
pkill find

# Wildcard
find ./ -name \*.[extension]
```

## Tips

###

```sh
#
find ./ -name '*.[extension]' -type f

#
find ./ -name '*.[extension]' -type f -delete
```

### Run in all subdirectories

```sh
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && [command]' \;
```

### Move all files from subfolders to parent folder

```sh
find ./ -mindepth 2 -type f -print -exec mv {} ./ \;
```

<!-- ###

```sh
find . -type f -exec /bin/sh -c 'echo "{}"' \;
find . -exec /bin/sh -c {}/"${name}" \;
``` -->
