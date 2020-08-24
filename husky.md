# Husky

## CLI

### Installation

#### NPM

```sh
npm install husky -D
```

### Configuration

```sh
cat << EOF > ./.huskyrc.json
{
  "hooks": {
    "pre-commit": "npm run pre-commit",
    "pre-push": "npm run pre-push",
    "commit-msg": "commitlint -E HUSKY_GIT_PARAMS"
  }
}
EOF
```
