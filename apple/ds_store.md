# Desktop Services Store (DS_Store)

## Configuration

### Desktop Services Store

```sh
# Git ignore
echo '/**/.DS_Store' >> ~/.gitignore_global
```

## Tips

### Find and Remove .DS_Store files

```sh
find . -name .DS_Store -print -delete
```

#### From Git history

```sh
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
```
