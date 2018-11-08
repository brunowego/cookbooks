# Examples

## Files

```sh
tree -a
```

## Directories

```sh
tree -d
```

## Colorize

```sh
tree -C
```

## Full path

```sh
tree -f
```

## Without indentation lines

```sh
tree -i
```

## Only files

```sh
tree -fFi | grep -v '/$'
```

## Filtering

```sh
tree -afi -I '.DS_Store|.git'
```
