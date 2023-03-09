# GitHub Repository

## Checklist

- [CodeQL](/github/codeql.md)
- [commitlint](/conventional-changelog/commitlint.md)
- [Trunk](/trunk/README.md)

## Settings

- Branch protection rules

## Tips

### Open All Repos

**Dependencies:** [GitHub CLI](/github/README.md#cli)

```sh
#
export OWNER='<owner>'

#
gh repo list "$OWNER" --limit 1000 | \
  awk '{print $1; }' | \
    xargs -I{} -L1 open 'https://github.com/{}'
```
