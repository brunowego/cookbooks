# Chromatic

## Links

- [Main Website](https://chromatic.com)
- [Docs / CLI](https://chromatic.com/docs/cli)

## CLI

### Dependencies

```sh
# Using NPM
npm install chromatic --save-dev

# Using Yarn
yarn add chromatic --dev
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "chromatic": "npx chromatic --project-token \"$CHROMATIC_PROJECT_TOKEN\""
  }
}
```

### Usage

```sh
#
export CHROMATIC_PROJECT_TOKEN=''

#
npx chromatic
```
