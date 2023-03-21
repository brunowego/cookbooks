# Git Checkout

## Usage

```sh
# Orphan Branch
git checkout --orphan <branch>
```

## Tips

### Checkout Main Branch

```sh
#
find . \
  -maxdepth 1 \
  -type d \( ! -name . \) \
  -exec bash \
  -c 'cd "{}"; git checkout main' \;

#
find . \
  -type d \
  -name '.git' \
  -exec bash \
  -c 'cd $(dirname "{}"); git checkout main' \;
```
