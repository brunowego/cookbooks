# React Email

## Links

- [Code Repository](https://github.com/resendlabs/react-email)
- [Main Website](https://react.email)
- [Examples](https://react.email/examples)

## Scaffold

### Commands

```sh
# Using NPM
npx create-email@latest -h

# Using Yarn
yarn create email -h

# Using pnpm
pnpm create email -h
```

### Create

```sh
# Using pnpm
pnpm create email ./
```

### Usage

```sh
#
NODE_DEBUG=preview-email email dev -d ./src/templates -p 8000

#
email export -d ./src/templates
```

### Issues

#### Command Not Found

```log
/bin/sh: next: command not found
```

**Refer:** `./pnpm-workspace.yaml`

```yml
---
packages:
  - ./apps/*
  - ./packages/*
  - ./packages/email/.react-email
```
