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

### Fetch/Pull All Branches

```sh
#
git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done

#
git fetch --all

#
git pull --all
```

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
