# Create Email

## Commands

```sh
# Using NPM
npx create-email@latest -h

# Using Yarn
yarn create email -h

# Using pnpm
pnpm create email -h
```

## Create

```sh
# Using pnpm
pnpm create email ./

# Using Bun
bun create email ./
```

## Usage

```sh
#
NODE_DEBUG=preview-email email dev -d ./src/templates -p 8000

#
email export -d ./src/templates
```

## Issues

### TBD

```log
Error: Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: undefined. You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.
```

TODO

### TBD

```log
Attempted import error: '../../emails/authentication-magic-link.tsx' does not contain a default export (imported as 'Mail').
```

TODO

### TBD

```log
Cannot find module 'react/jsx-runtime' or its corresponding type declarations. ts(2307)
...
✘ [ERROR] Could not resolve "react/jsx-runtime"
```

<!--
https://github.com/resend/react-email/issues/1442
https://github.com/resend/react-email/issues/1422#issuecomment-2072163519

pnpm add react@latest react-dom@latest
-->

TBD

### Command Not Found

```log
/bin/sh: next: command not found
```

<!-- **Refer:** `./pnpm-workspace.yaml`

```yml
---
packages:
  - ./apps/*
  - ./packages/*
  - ./packages/email/.react-email
``` -->

**Refer:** `./package.json`

```json
{
  // ...
  "workspaces": [".react-email"]
}
```
