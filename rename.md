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

#### Slugify

```sh
rename -fvc --nows *
```

#### Replace (regex)

```sh
rename -v 's/[from]/[to]/' *
```

<!-- ####

```sh
find . -iname '.*' -exec realpath {} \; | rename -n 's/\.(.*)/$1/'
find . -iname '.*' -exec realpath {} \; | rename 's/\.(.*)/$1/'
``` -->
