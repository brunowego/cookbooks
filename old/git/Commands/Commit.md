# Commit

```sh
git commit -a -m [message]
```

## Modify Specified Commit

Modify `pick` to `edit`:

```sh
git rebase -i '[hash]^'
```

```sh
git commit --all --amend --no-edit
```

```sh
git rebase --continue
```

## Rewriting Commit Messages

```sh
git log --oneline
```

Modify `pick` to `reword`:

```sh
git rebase -i HEAD~3
```

## Inject Commit Between Commits

```sh
git log --oneline
```

Modify `pick` to `edit`:

```sh
git rebase -i HEAD~3
```

```sh
git commit --all -m 'New commit'
```

```sh
git rebase --continue
```

## Change Author

```sh
git log
```

```sh
# First Commit
git rebase -i --root

#
git rebase -ir '[hash]^'
```

```sh
git commit --amend --author='[name] <[email]>'
```

```sh
git rebase --continue
```
