# diff

## Tools

- [Diffchecker](https://diffchecker.com/)
- [Text Compare!](https://text-compare.com/)

## CLI

### Command

```sh
diff --help
```

### Usage

```sh
# Editor understands
diff -e [initial-file] [file-compare] > [file-output]

# Unified
diff -u [initial-file] [file-compare] | sed -n '1,2d;/^[-+]/p'

#
# diff --git a/diff_test.txt b/diff_test.txt
```
