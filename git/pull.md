# Git Pull

## Tips

### Update Current Branch with Remote

```sh
#
git pull origin main
```

### Run Subdirectories

```sh
#
find . \
  -type d \
  -maxdepth 2 \
  -name '.git' \
  -exec bash \
  -c 'cd $(dirname "{}"); git pull' \;
```

## Issues

### Refusing Merge

```log
fatal: refusing to merge unrelated histories
```

```sh
git pull --allow-unrelated-histories
```

### Turn Off Fast-Forward

```log
fatal: Not possible to fast-forward, aborting.
```

```sh
git pull --no-ff
```
