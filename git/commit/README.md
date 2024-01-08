# Git Commit

## Guidelines

- [Semantic Commit Messages](https://sparkbox.com/foundry/semantic_commit_messages)
- [EU System](https://ec.europa.eu/component-library/v1.15.0/eu/docs/conventions/git/)

## Tools

- [commitlint](/conventional-changelog/commitlint.md)

<!--
- [semantic-release](/semantic-release.md)
-->

## Usage

```sh
git commit -am <message>
```

## Tips

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
git commit --date 'Wed Feb 16 14:00 2037 +0100'
```

### Visual Studio Code

```sh
#
code --install-extension mhutchie.git-graph
# code --install-extension donjayamanne.githistory

#
jq '."recommendations" += ["mhutchie.git-graph"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
# jq '."recommendations" += ["donjayamanne.githistory"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```

### Modify Specified Commit

Modify `pick` to `edit`:

```sh
git rebase -i '[hash]^'

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
