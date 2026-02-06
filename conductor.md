# Conductor

<!--
https://superset.sh/
https://github.com/stravu/crystal
-->

**Keywords:** Parallel Agents Orchestration

https://github.com/stravu/crystal
-->

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
