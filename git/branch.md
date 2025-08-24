# Git Branch

## Usage

```sh
# Show upstream branch
git branch -vv

# Show remote branches
git branch -r

#
git ls-remote --heads

# Show remote branches
git show-branch -r

# Show local branches that are not tracking any remote branch
git branch -vv | grep -v origin
```

## Tips

### Push All Branches

```sh
#
for branch in $(git branch --format='%(refname:short)'); do git rev-parse --verify --quiet origin/$branch >/dev/null || git push -u origin $branch; done

#
git branch -vv | grep -v origin
```

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
#
git branch -m <newname>

#
git branch -m <oldname> <newname>
```
