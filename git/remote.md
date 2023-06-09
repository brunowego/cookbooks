# Remote

## Usage

```sh
# Show remote URL
git remote -v

# Set URL
git remote set-url origin <repo>

# Remove
git remote rm origin
```

## Tips

### Show remote URL from each subfolder

```sh
ls -d1 ./* | xargs -I {} bash -c 'cd "{}" && git remote -v'
```
