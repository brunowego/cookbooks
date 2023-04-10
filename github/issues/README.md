# GitHub Issues

## Docs

- Labels and milestones
  - [About milestones](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/about-milestones)

## Tips

### Disable Issues

```sh
#
export OWNER='<owner>'
export REPO='<repo>'

# Specific Repo
gh repo edit "$OWNER/$REPO" --enable-issues=false

# All Repos
gh repo list "$OWNER" \
  --json nameWithOwner \
  -L 100 \
  -t '{{range .}}{{.nameWithOwner}}{{"\n"}}{{end}}' | \
    xargs -I {} sh -c 'gh repo edit {} --enable-issues=false'
```
