# Fork

## Syncing

```sh
git fetch upstream
git checkout [branch]
git merge upstream/[branch]
```

## Fix Conflicts

```sh
git remote -v
git remote add upstream [repo]
```

```sh
git fetch upstream
git checkout [branch]
git rebase upstream/[branch]
```

```sh
git add [file]
git rebase --continue
```
