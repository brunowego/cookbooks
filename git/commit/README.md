# Git Commit

## Guidelines

- [Semantic Commit Messages](https://sparkbox.com/foundry/semantic_commit_messages)
- [EU System](https://ec.europa.eu/component-library/v1.15.0/eu/docs/conventions/git/)

## Tools

- [aicommits](/aicommits.md) 🌟
- [commitlint](/conventional-changelog/commitlint.md)
- [gptcommit](/gptcommit.md)
- [OpenCommit](/opencommit.md)

<!--
- [semantic-release](/semantic-release.md)
-->

## Semantic Commit Messages

```txt
chore: add Oyster build script
docs: explain hat wobble
feat: add beta sequence
fix: remove broken confirmation message
ref: share logic between 4d3d3d3 and flarhgunnstow
style: convert tabs to spaces
test: ensure Tayne retains clothing
```

## Usage

```sh
git commit -am <message>
```

## Tips

### Amend Last Commit with Same Date

```sh
git commit --amend --no-edit --date="$(git show -s --format=%ci HEAD)"
```

### Information

```sh
#
git --no-pager show $(git rev-list --max-parents=0 HEAD)

#
git --no-pager shortlog -s -n
```

### Change Author

```sh
git commit --amend --author 'Bruno Wego <brunowego@gmail.com>'
```

#### Change Author for Specific Commit

```sh
git log

#
git rebase -i --root

#
git rebase -ir '[hash]^'

#
git commit --amend --author='[name] <[email]>'

#
git rebase --continue
```

### Bypass pre-commit and commit-msg hooks

```sh
#
git commit -nm '<message>'
```

### Date

```sh
git commit --date '10 day ago' -m '<message>'
git commit --date 'Wed Feb 16 14:00 2037 +0100' -m "<message>"

git commit --amend --no-edit --date='10 day ago'
```

### Modify Specified Commit

Modify `pick` to `edit`:

```sh
# Get hash of commit to modify
git log --oneline

git rebase -i '<hash>^'

git commit --all --amend --no-edit

git rebase --continue
```

### Rewriting Commit Messages

```sh
# Get hash of commit to modify
git log --oneline

#
git rebase -i <hash>
```

Modify `pick` to `reword`:

### Inject Commit Between Commits

```sh
git log --oneline
```

Modify `pick` to `edit`:

```sh
git rebase -i HEAD~3

git commit --all -m 'New commit'

git rebase --continue
```

## Issues

### Amend Merge

```log
fatal: You are in the middle of a merge -- cannot amend.
```

```sh
git commit -a
```
