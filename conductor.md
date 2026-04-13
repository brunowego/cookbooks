# Conductor

<!--
https://paseo.sh
https://super.engineering/
https://agents-os.dev/
https://superset.sh
https://github.com/stravu/crystal
https://getpolyscope.com
https://cmux.dev
https://github.com/stravu/crystal
https://agents.craft.do
https://vvterm.com
-->

<!--
git fetch origin
git branch --set-upstream-to=origin/<branch>
git pull --rebase
-->

**Keywords:** Parallel Agents Orchestration

## Links

- [Main Website](https://conductor.build)
- [Docs](https://docs.conductor.build)

## App

### Installation

```sh
# Using Homebrew
brew install --cask conductor
```

### Tips

#### TBD

```sh
# List running MCP
ps aux | grep -i mcp | grep -v grep | awk '{print $2, $11, $12, $13}'

#
ps aux | grep -i mcp | grep -v grep | awk '{cpu+=$3; mem+=$4; count++} END {printf "Processes: %d | CPU: %.1f%% | MEM: %.1f%%\n", count, cpu, mem}'

# Kill running MCP
ps aux | grep -i mcp | grep -v grep | awk '{print $2}' | xargs kill -9
```

<!-- #### Custom Profile

```sh
mkdir -p "$HOME/.conductor-profiles/swite"

HOME="$HOME/.conductor-profiles/swite" open -n /Applications/Conductor.app

ls "$HOME/.conductor-profiles/swite"

ln -s "$HOME/Library/Keychains" ~/.conductor-profiles/swite/Library/Keychains
ln -s "$HOME/Library/Application Support" ~/.conductor-profiles/swite/Library/Application\ Support

rm -rf "$HOME/.conductor-profiles/swite/.oh-my-zsh" && ln -s "$HOME/.oh-my-zsh" "$HOME/.conductor-profiles/swite/.oh-my-zsh"
rm -rf "$HOME/.conductor-profiles/swite/.cache" && ln -s "$HOME/.cache" "$HOME/.conductor-profiles/swite/.cache"
rm -rf "$HOME/.conductor-profiles/swite/.config" && ln -s "$HOME/.config" "$HOME/.conductor-profiles/swite/.config"
rm -rf "$HOME/.conductor-profiles/swite/.mcp-auth" && ln -s "$HOME/.mcp-auth" "$HOME/.conductor-profiles/swite/.mcp-auth"
rm -rf "$HOME/.conductor-profiles/swite/.zsh_history" && ln -s "$HOME/.zsh_history" "$HOME/.conductor-profiles/swite/.zsh_history"
rm -rf "$HOME/.conductor-profiles/swite/.zsh_sessions" && ln -s "$HOME/.zsh_sessions" "$HOME/.conductor-profiles/swite/.zsh_sessions"
rm -rf "$HOME/.conductor-profiles/swite/.volta" && ln -s "$HOME/.volta" "$HOME/.conductor-profiles/swite/.volta"
rm -rf "$HOME/.conductor-profiles/swite/.npm" && ln -s "$HOME/.npm" "$HOME/.conductor-profiles/swite/.npm"
rm -rf "$HOME/.conductor-profiles/swite/.cursor" && ln -s "$HOME/.cursor" "$HOME/.conductor-profiles/swite/.cursor"
rm -rf "$HOME/.conductor-profiles/swite/.local" && ln -s "$HOME/.local" "$HOME/.conductor-profiles/swite/.local"
rm -rf "$HOME/.conductor-profiles/swite/.claude" && ln -s "$HOME/.claude" "$HOME/.conductor-profiles/swite/.claude"
rm -rf "$HOME/.conductor-profiles/swite/.claude.json" && ln -s "$HOME/.claude.json" "$HOME/.conductor-profiles/swite/.claude.json"
rm -rf "$HOME/.conductor-profiles/swite/Library/Application Support/Cursor" && ln -s "$HOME/Library/Application Support/Cursor" "$HOME/.conductor-profiles/swite/Library/Application Support/Cursor"
rm -rf "$HOME/.conductor-profiles/swite/Library/pnpm" && ln -s "$HOME/Library/pnpm" "$HOME/.conductor-profiles/swite/Library/pnpm"

HOME="$HOME/.conductor-profiles/swite" gh auth status 2>&1
``` -->

<!--
unlink ~/.conductor-profiles/swite/Library

gh auth setup-git

ln -s /Users/brunogomes/Library/Keychains ~/.conductor-profiles/<profile-name>/Library/Keychains

ls ~/.conductor-profiles/swite/Library/Keychains
-->

#### Env Variables

```sh
cp "$CONDUCTOR_ROOT_PATH/.env.local" ./.env.local
```

#### Worktrees

```sh
ls -la ~/conductor/workspaces

# git worktree list
# git worktree remove <path-to-worktree>
# git worktree prune
```

<!--
## Coverage Review Checklist

- Run test coverage and confirm 100% line coverage and 100% branch coverage
- Every code change must include corresponding tests for the new/modified code
- Verify edge cases, error handling, and conditional branches are all tested
- If coverage gaps exist, suggest specific tests that should be added
- Check that tests are meaningful and validate actual behavior, not just coverage padding

---

## PR Coverage Requirements

Before creating the PR:
1. Run `npm run test:coverage` and include the coverage summary in the PR description
2. Confirm 100% line coverage and 100% branch coverage
3. If any files show < 100% coverage, add tests before creating the PR
4. List any new test files added in the PR description

---

Use descriptive branch names. For test-related work, prefix with `test/` (e.g., `test/add-coverage-for-auth-module`).

---

## Test Coverage Policy

This project requires 100% code coverage and 100% branch coverage at all times.

Every code improvement must include tests for the new/modified code.

Before completing any task that modifies code:
1. Run `npm run test:coverage` (or the project's coverage command)
2. Verify both line coverage and branch coverage are at 100%
3. If new code was added, ensure tests exist that cover all lines and branches of that code

No code change is complete until its tests are written.
-->
