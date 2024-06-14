# Git Search

<!--
grep
-->

## Tips

### Search Text Across All Branches

```sh
#
git rev-list --all | xargs git grep '<pattern>'

#
git branch --contains <commit>
```

### Find File from All Branches

```sh
git log --all --pretty=short -- '**/<filename>'
```
