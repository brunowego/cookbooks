# Release It

## Links

- [Code Repository](https://github.com/release-it/release-it)

## CLI

### Installation

```sh
# Using npm
npm install release-it -g

# Using Homebrew
brew install release-it
```

### Initialize

```sh
npm init release-it
```

## Library

### Installation

```sh
# Using pnpm
pnpm add release-it -D
```

### Configuration

**Refer:** `./.release-it.json`

```json
{
  "$schema": "https://unpkg.com/release-it@17/schema/release-it.json",
  "git": {
    "commitMessage": "chore: release v${version}"
  },
  "npm": false,
  "github": {
    "release": true
  }
}
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "release:ci": "release-it --ci"
  }
}
```

```sh
#
pnpm release:ci
pnpm release:ci --no-git.tag
pnpm release:ci --no-git.requireCleanWorkingDir
pnpm release:ci --no-git.requireCleanWorkingDir --dry-run
```

### Issues

#### TBD

```log
ERROR Working dir must be clean.
```

TODO

#### TBD

```log
WARNING Unable to verify if user <username> is a collaborator for @<owner>/<repo-name>.
```

TODO
