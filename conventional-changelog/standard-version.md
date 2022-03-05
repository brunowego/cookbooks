# Standard Version

## Links

- [Code Repository](https://github.com/conventional-changelog/standard-version)

## Library

### Dependencies

- Follow [Semantic Versioning (SemVer)](/semver.md)

### Installation

```sh
# Using NPM
npm install standard-version --save-dev

# Using Yarn
yarn add standard-version --dev
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "release": "standard-version",
    "postrelease": "git push --follow-tags origin HEAD"
    // "postrelease": "git push --follow-tags origin HEAD && npm publish"
  }
}
```

<!-- **Refer:** `./.versionrc.json`

```json
{
  "types": [
    { "type": "feat", "section": "New features" },
    { "type": "fix", "section": "Bug fixes" },
    { "type": "docs", "section": "Documentation" },
    { "type": "refactor", "section": "Code refactor" },
    { "type": "perf", "section": "Performance improvements" },
    { "type": "test", "section": "Unit tests" }
  ]
}
``` -->

## CLI

### Commands

```sh
npx standard-version -h
```

### Usage

```sh
#
npx standard-version

#
npx standard-version --release-as minor
npx standard-version --release-as patch
```

### Issues

#### Missing Semantic Versioning

```log
Invalid Version: undefined
```

Need follow [Semantic Versioning (SemVer)](/semver.md).
