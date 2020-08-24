# commitlint

## References

- [Rules](https://github.com/conventional-changelog/commitlint/blob/master/docs/reference-rules.md)

## CLI

### Installation

#### NPM

```sh
npm install @commitlint/cli @commitlint/config-conventional -D
```

### Configuration

```sh
cat << EOF > .commitlintrc.json
{
  "extends": [
    "@commitlint/config-conventional"
  ]
}
EOF
```
