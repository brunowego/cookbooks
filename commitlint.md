# commitlint

## References

- [Code Repository](https://github.com/conventional-changelog/commitlint)
- [Main Website](https://commitlint.js.org/#/)
- [Rules](https://github.com/conventional-changelog/commitlint/blob/master/docs/reference-rules.md)

## CLI

### Installation

#### NPM

```sh
npm install @commitlint/cli @commitlint/config-conventional --save-dev
```

### Configuration

```sh
cat << EOF > ./.commitlintrc.json
{
  "extends": [
    "@commitlint/config-conventional"
  ]
}
EOF
```

### Tips

#### Using with Husky

```sh
#
npx husky add ./.husky/commit-msg 'npx --no-install commitlint --edit "$1"'

#
npx husky install
```
