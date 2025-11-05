# Git Search

<!--
grep
-->

## Tips

### Search Branches

```sh
#
git branch --list '*<text>*'
```

### Search Text Across All Branches

```sh
#
git rev-list --all | xargs git grep '<pattern>'

#
git branch --contains <commit>
```

**Advanced:**

```sh
#
export PATTERN='<text>'

#
for branch in $(git for-each-ref --format='%(refname:short)' refs/remotes/origin/); do
  matches=$(git grep -l "$PATTERN" "$branch" -- ':!pnpm-lock.yaml' ':!bun.lockb')
  if [ -n "$matches" ]; then
    echo "🔹 $branch"
    echo "$matches" | sed 's/^/   └── /'
  fi
done
```

### Find File from All Branches

```sh
git log --all --pretty=short -- '**/<filename>'
```
