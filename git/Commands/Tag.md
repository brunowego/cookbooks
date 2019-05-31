# Tag

## Create

```sh
git tag [version]
```

### Describe

```sh
git tag -a [version] -m [message]
```

### Push with Tags

```sh
git push origin master --tags
```

## List

```sh
git tag -l
```

### Remote

```sh
git ls-remote --tags
```

## Delete

```sh
git tag -d [version]
```

### Remote

```sh
git push --delete origin [version]
```
