# Remove

## Remove

```sh
git rm -r [path]
```

### Cache

```sh
git rm -r --cached [path]
```

## Restore

```sh
git ls-files -d | xargs git checkout --
```
