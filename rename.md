# rename

## References

- [GNU sed](/gnu-sed#examples)

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

### Tips

#### Slugify

```sh
rename \
  --dry-run \
  -fvc \
  --nows \
  *
```

#### Replace (regex)

```sh
#
rename \
  --dry-run \
  -v \
  's/[from]/[to]/' \
  *

#
find . \
  -type f \
  -exec rename \
    --dry-run \
    -v \
    's/[from]/[to]/' \
    {} +
```

#### Replace Extension

```sh
# Option 1
find . \
  -name '*.[extension]' \
  -print0 | \
    xargs -0 rename \
      --dry-run \
      -v \
      's/.[from-ext]$/.[to-ext]/'

# Option 2
find . \
  -iname '*.[extension]' \
  -exec realpath {} \; | \
    rename \
      --dry-run \
      -v \
      's/.[from-ext]$/.[to-ext]/'
```
