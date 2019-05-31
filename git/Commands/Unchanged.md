# Unchanged

## Prevent to receive changed files

```sh
git update-index --no-assume-unchanged [file]
```

## Ignore local changed files

```sh
git update-index --assume-unchanged [file]
```

## List files with `assume-unchanged`

```sh
git ls-files -v | grep '^h'
```
