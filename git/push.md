# Git Push

## Usage

```sh
# Set Upstream
git branch --set-upstream-to=origin/<branch> <branch>

#
git push -u origin <local-branch>:<remote-branch>

#
git push origin <commit-sha>:<remote-branch> -f
```

## Tips

### Push to Remote using HEAD

```sh
git push origin HEAD
```

## Issues

### Reset preview after squash merge release

When a release PR (`preview` → `main`) is accidentally merged with "Squash and merge" instead of "Create a merge commit", the branches diverge in commit history despite having identical content. This causes GitHub to show a noisy sync-back PR with hundreds of files changed. To fix, reset `preview` to match `main` directly:

```bash
git push origin origin/main:refs/heads/preview --force
```

> **Note:** Requires temporarily disabling force-push protection on the `preview` branch in **Settings → Branches**.
> **Prevention:** Always use "Create a merge commit" for release PRs from `preview` → `main`. Squash merge rewrites the commit history, making the branches incompatible for sync-back.

### TBD

```log
✔ No changes to remote for push
Everything up-to-date
```

TODO
