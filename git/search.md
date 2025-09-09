# Git Search

<!--
grep
-->

## Tips

### Search Branches

```sh
#
git branch --list '*<text>*'
```

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
