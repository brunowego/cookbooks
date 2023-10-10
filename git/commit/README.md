# Git Commit

## Guidelines

- [Semantic Commit Messages](https://sparkbox.com/foundry/semantic_commit_messages)
- [EU System](https://ec.europa.eu/component-library/v1.15.0/eu/docs/conventions/git/)

## Tools

- [commitlint](/conventional-changelog/commitlint.md)

<!--
- [semantic-release](/semantic-release.md)
-->

## Tips

### Bypass pre-commit and commit-msg hooks

```sh
#
git commit -nm '<message>'
```

### Date

```sh
git commit --date 'Wed Feb 16 14:00 2037 +0100'
```

#### Visual Studio Code

```sh
#
code --install-extension donjayamanne.githistory

#
jq '."recommendations" += ["donjayamanne.githistory"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```
