# diff

## Command

```sh
diff --help
```

## Examples

###

```sh
diff -e [initial-file] [file-compare] > [file-output]
```

### Unified

```sh
diff -u [initial-file] [file-compare] | sed -n '1,2d;/^[-+]/p'
```
