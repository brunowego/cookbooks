# Kodiak

## Links

- [Main Website](https://kodiakhq.com)

## Docs

- [Configuration Reference](https://kodiakhq.com/docs/config-reference)

## Installation

1. [Kodiak](https://kodiakhq.com) -> Install on GitHub
2. Base Plan -> Install if for free
3. Complete order and begin installation
4. Install kodiakhq -> Check All repositories -> Install

### Label Creation

1. Issues -> Labels
2. New label
   - Label name: `automerge`
   - Description: `To automatically merge PRs that are ready`
   - Color: `#8f4fbc`

## Configuration

**Refer:** `./.kodiak.toml`

```toml
version = 1

[approve]
auto_approve_usernames = ["dependabot"]

[merge.automerge_dependencies]
versions = ["minor", "patch"]
usernames = ["dependabot"]
```

<!--
renovate
-->
