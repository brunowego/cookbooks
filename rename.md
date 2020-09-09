# rename

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
rename -fvc --nows *

# Replace (regex)
rename \
  -v \
  --dry-run \
  's/[from]/[to]/' \
  *
```

<!-- ####

```sh
find . -iname '.*' -exec realpath {} \; | rename -n 's/\.(.*)/$1/'
find . -iname '.*' -exec realpath {} \; | rename 's/\.(.*)/$1/'
``` -->
