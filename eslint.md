# ESLint

## CLI

### Installation

#### Homebrew

```sh
brew install eslint
```

### Commands

```sh
eslint -h
```

#### Configuration

```sh
touch .eslintrc.json || exit
```

```json
{
  "ecmaFeatures": {
    "modules": true
  },
  "env": {
    "es6": true
  },
  "rules": {
    "quotes": [
      2,
      "single"
    ]
  }
}
```

### Tips

#### Visual Studio Code

```sh
code --install-extension dbaeumer.vscode-eslint
```
