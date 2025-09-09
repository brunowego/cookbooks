# Vitest Related

## Configuration

```json
{
  // ...
  "scripts": {
    "test": "vitest",
    "test:changed": "vitest related --changed",
    "test:staged": "vitest related $(git diff --cached --name-only)"
  }
  // ...
}
```

### Commands

```sh
#
vitest related --changed
```

### Issues

#### TBD

```log
sh: vitest: command not found
```

<!--
Monorepo: Try find in apps, packages, tooling
-->

TODO
