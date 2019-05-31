# Version

## Current

```sh
git describe --tags
```

##

```sh
git describe --tags --abbrev=0
```

##

```sh
git describe --tags | sed 's/^v//'
```

##

```sh
git describe --tags | cut -d - -f 1 | sed 's/^v//'
```
