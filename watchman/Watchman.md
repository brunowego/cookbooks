# Watchman

## Installation

### Homebrew

```sh
brew install watchman
```

## Watch

```sh
watchman watch [path]
```

```sh
watchman watch-del [path]

watchman watch-del-all
```

```sh
watchman watch-list
```

```sh
watchman watch-project [path]
```

## Trigger

```sh
watchman -- trigger [path] [name] [patterns] -- [cmd]
```

```sh
watchman trigger-del [path] [name]
```

```sh
watchman trigger-list [path]
```
