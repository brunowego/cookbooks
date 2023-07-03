# Git Merge

## Tips

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

### Not Concluded Merge

```log
Git: You have not concluded your merge (MERGE_HEAD exists).
```

```sh
#
git merge --continue
```
