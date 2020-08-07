# ESLint

## CLI

### Installation

#### Homebrew

```sh
brew install eslint
```

### NPM

```sh
npm install eslint -D
```

### Commands

```sh
eslint -h
```

#### Configuration

```sh
cat << EOF > .eslintrc.json
{
  "root": true,
  "extends": "eslint:recommended",
  "parserOptions": {
    "ecmaVersion": 8
  },
  "env": {
    "node": true
  },
  "rules": {
    "indent": ["error", 2],
    "linebreak-style": ["error", "unix"],
    "max-len": ["error", 80],
    "quotes": ["error", "single"],
    "semi": ["error", "always"]
  }
}

EOF
```

### Tips

#### Visual Studio Code

```sh
code --install-extension dbaeumer.vscode-eslint
```
