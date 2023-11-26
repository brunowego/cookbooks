# rimraf

## CLI

### Commands

```sh
# Using Yarn
yarn dlx rimraf -h

# Using pnpm
pnpm dlx rimraf -h
```

## Library

### Installation

```sh
# Using pnpm
pnpm add rimraf -D
```

### Configuration

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "clean": "rimraf ./{dist,coverage}"
    // ...
  }
}
```
