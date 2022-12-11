# Git Log

## Tips

### Get Git Authors

```sh
# Emails
git log --pretty=format:'%h %ce %ae'

# Names
git shortlog -s | cut -c8-
# or
git shortlog -s -n --all --no-merges
```
