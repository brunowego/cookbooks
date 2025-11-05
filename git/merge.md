# Git Merge

## Tips

### Clean Merged Branches

```sh
#
git fetch -p

#
git branch --merged main | grep -v "main" | xargs git branch -d
```

### Monorepo

```sh
#
export OWNER='<owner>'
export REPO='<repo>'

#
git remote add "$REPO" "https://github.com/${OWNER}/${REPO}.git"

git fetch "$REPO" --tags

git merge --allow-unrelated-histories "$REPO"/main

git remote remove "$REPO"
```

## Issues

### TBD

```log
fatal: refusing to merge unrelated histories
```

TODO

<!--
git merge --allow-unrelated-histories <branch-name>
-->

### Not Concluded Merge

```log
Git: You have not concluded your merge (MERGE_HEAD exists).
```

```sh
git merge --continue
```

### TBD

```log
fatal: You have not concluded your merge (MERGE_HEAD exists).
Please, commit your changes before you merge.
```

```sh
git merge --abort
```
