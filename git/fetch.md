# Git Fetch

## Usage

```sh
#
git fetch --all
```

## Tips

### Run Subdirectories

```sh
#
find . \
  -type d \
  -maxdepth 2 \
  -name '.git' \
  -exec bash \
  -c 'cd $(dirname "{}"); git fetch --all' \;
```
