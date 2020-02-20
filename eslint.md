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

### Examples

####

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
