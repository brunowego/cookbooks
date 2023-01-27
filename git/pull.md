# Git Pull

## Tips

### Run Subdirectories

```sh
#
find . \
  -type d \
  -name '.git' \
  -exec bash \
  -c 'cd $(dirname "{}"); git pull' \;
```
