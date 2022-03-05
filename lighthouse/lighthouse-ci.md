# Lighthouse CI

## Links

- [Code Repository](https://github.com/GoogleChrome/lighthouse-ci)

## Library

### Installation

```sh
# Using NPM
npm install @lhci/cli --save-dev

# Using Yarn
yarn add @lhci/cli --dev
```

### Configuration

```sh
#
echo '/.lighthouseci' >> ./.gitignore
```

**Refer:** `./.lighthouserc.json`

```json
{
  "ci": {
    "collect": {
      "startServerCommand": "yarn start",
      "url": ["http://localhost:3000"],
      "numberOfRuns": 1
    },
    "assert": {
      "preset": "lighthouse:recommended",
      "assertions": {
        "csp-xss": ["warn"],
        "image-size-responsive": ["warn"],
        "unsized-images": ["warn"],
        "unused-javascript": ["warn"]
      }
    },
    "upload": {
      "target": "temporary-public-storage"
    }
  }
}
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    // "pretest:lighthouse": "yarn build",
    "test:lighthouse": "lhci autorun"
  }
}
```

```sh
#
yarn build

#
yarn test:lighthouse
```

## CLI

### Commands

```sh
npx @lhci/cli -h
```

### Usage

```sh
#
npx @lhci/cli autorun
```
