# React Email

## Links

- [Code Repository](https://github.com/resendlabs/react-email)
- [Main Website](https://react.email)

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

### Issues

#### Command Not Found

```log
sh: next: command not found
```

**Refer:** `./pnpm-workspace.yaml`

```yml
---
packages:
  - ./apps/*
  - ./packages/*
  - ./packages/email/.react-email
```
