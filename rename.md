# rename

## Installation

### Homebrew

```sh
brew install rename
```

## Commands

```sh
rename
```

## Examples

###

```sh
rename --force --lower-case --nows *
```

### Replace

```sh
rename -v 's/[from]/[to]/' *.[extension]
```

### Recursive

#### File

```sh
find . -type f -iname \*.[extension] -exec rename -v 's/[from]/[to]/' {} +
```

#### Directory

```sh
find . -type d -iname \* -exec rename -v 's/[from]/[to]/' {} +
```
