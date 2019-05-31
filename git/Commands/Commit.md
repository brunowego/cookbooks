# Commit

```sh
git commit -a -m [message]
```

## Modify Specified Commit

Modify `pick` to `edit`:

```sh
git rebase --interactive '[hash]^'
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
git rebase --interactive HEAD~3
```

## Inject Commit Between Commits

```sh
git log --oneline
```

Modify `pick` to `edit`:

```sh
git rebase --interactive HEAD~3
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
git rebase --interactive --preserve-merges '[hash]^'
```

```sh
git commit --amend --author="[name] <[email]>"
```

```sh
git rebase --continue
```

## First Commit

```sh
git rebase --interactive --root
```

```sh
git rebase --continue
```
