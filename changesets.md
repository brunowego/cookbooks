# Changesets

**Keywords:** Monorepo Versioning, Multi-Package Repository

## Links

- [Code Repository](https://github.com/changesets/changesets)

## Library

### Links

- [Code Repository](https://github.com/changesets/changesets/tree/main/packages/cli)

### Installation

```sh
# Using pnpm
pnpm add @changesets/cli @changesets/changelog-github -D
```

### Commands

```sh
#
pnpm changeset --help
#
./node_modules/.bin/changeset --help
```

### Initialize

```sh
# Using pnpm
pnpm changeset init
```

### Usage

```sh
#
pnpm changeset add

#
pnpm changeset version
pnpm changeset version --snapshot

#
pnpm changeset publish
```

<!--
"release": "pnpm dist && changeset publish"
-->

### Issues

#### TBD

```log
🦋  warn No unreleased changesets found, exiting.
```

TODO

#### TBD

```log
🦋  warn @acme/email is not being published because version 0.0.9 is already published on npm
🦋  warn No unpublished projects to publish
```

TODO
