# Conventional Commits

**Keywords:** Semantic Commit Messages

## References

- [Main Website](https://conventionalcommits.org/en/)
- [Rules](https://github.com/conventional-changelog/commitlint/blob/master/docs/reference-rules.md)

## Related

- [commitlint](/conventional-changelog/commitlint.md#cli)

## Pattern

### Usage

```text
type(category): description [flags]
```

#### Allowed `<type>` values

- breaking
- build
- ci
- chore
- docs
- feat
- fix
- other
- perf
- refactor
- revert
- style
- test

#### Example `<scope>` values

- init
- runner
- watcher
- config
- web-server
- proxy
- etc

## Tips

### Messages

```text
❌ adding image logo
✅ style: add logo image

❌ modifying classnames
✅ refactor: remove empty space

❌ removing yarn lock file
✅ chore: remove yarn lock file
```
