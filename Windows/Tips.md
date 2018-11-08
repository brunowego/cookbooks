# Tips

## Find and remove Thumbs.db files

```sh
find . -name Thumbs.db -print0 | xargs -0 git rm -f --ignore-unmatch
```
