# rename

## Links

- [Main Website](http://plasmasturm.org/code/rename/)

## References

- [GNU sed](/gnu/sed#examples)

## CLI

### Installation

#### Homebrew

```sh
brew install rename
```

### Commands

```sh
rename
```

### Usage

```sh
# Slugify
rename \
  --dry-run \
  -fvc \
  --nows \
  *

# Replace (regex)
rename \
  --dry-run \
  -v \
  's/<from>/<to>/' \
  *

find . \
  -type f \
  -exec rename \
    --dry-run \
    -v \
    's/<from>/<to>/' \
    {} +

# Replace Extension: Option 1
find . \
  -name '*.<extension>' \
  -print0 | \
    xargs -0 rename \
      --dry-run \
      -v \
      's/.<from-ext>$/.<to-ext>/'

# Replace Extension: Option 2
find . \
  -iname '*.<extension>' \
  -exec realpath {} \; | \
    rename \
      --dry-run \
      -v \
      's/.<from-ext>$/.<to-ext>/'
```
