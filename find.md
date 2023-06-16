# Commands

## Alternatives

- [fd](/fd.md)

## References

- [Find syntax](<https://en.wikipedia.org/wiki/Find_(Unix)#Find_syntax>)

## Commands

```sh
man find
```

## Usage

```sh
# Find file with name
find . -type f -name '<filename>'

# Find files where filename ends with space
find . -type f -name '* '

# Find Folder
find . \
  -name '<name>' \
  -type d \
  -maxdepth 2

# With Wildcard
find . -name \*.<extension>
```

## Tips

### Search Text on Files

```sh
find . -name '<filename>' -exec grep -i '<text>' {} \; -print
```

### Kill Process

```sh
# Kill Process
pkill find
```

### TBD

```sh
#
find . \
  -type f \
  -not -path '*node_modules*' | \
    grep -oE '\.(\w+)$' | \
      sort -u
```

### Find by Extension

```sh
#
find . -name '*.<extension>' -type f

#
find . -name '*.<extension>' -type f -delete
```

### Run in all subdirectories

```sh
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && [command]' \;
```

### Move all files from subfolders to parent folder

```sh
find . -mindepth 2 -type f -print -exec mv {} ./ \;
```

<!-- ###

```sh
find . -type f -exec /bin/sh -c 'echo "{}"' \;
find . -exec /bin/sh -c {}/"${name}" \;
``` -->
