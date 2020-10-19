# rename

## References

- [GNU sed](/gnu_sed#examples)

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
  's/[from]/[to]/' \
  *

#
find ./ -name '*.[from-ext]' -print0 | \
  xargs -0 rename --dry-run 's/.[from-ext]$/.[to-ext]/'

#
find ./ -iname '*.[extension]' -exec realpath {} \; | \
  rename --dry-run 's/.[from-ext]$/.[to-ext]/'
```
