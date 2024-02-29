# Git Branch

## Usage

```sh
# Show upstream branch
git branch -vv

#
git branch -r

#
git ls-remote --heads

#
git show-branch -r
```

## Tips

### With Sort

```sh
git branch --sort -committerdate
```

### Set Upstream Branch

```sh
git branch --set-upstream-to=origin/<branch> <branch>
```

<!--
git branch --set-upstream-to <remote-branch>
-->

### Rename Branch

<!--
https://stackoverflow.com/questions/6591213/how-can-i-rename-a-local-git-branch
-->

```sh
git branch -m <newname>
```
