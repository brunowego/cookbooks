# Standard Version

## CLI

### Installation

#### NPM

```sh
npm install standard-version -D
```

### Configuration

```json
{
  "scripts": {
    "release": "standard-version",
    "postrelease": "git push --follow-tags origin HEAD && npm publish"
  }
}
```

```sh
cat << EOF > ./.versionrc.json
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
EOF
```
