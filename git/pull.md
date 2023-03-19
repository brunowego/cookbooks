# Git Pull

## Tips

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

### Turn Off Fast-Forward

```log
fatal: Not possible to fast-forward, aborting.
```

```sh
git pull --no-ff
```
