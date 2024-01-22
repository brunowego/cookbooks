# TypeBox

## Links

- [Code Repository](https://github.com/sinclairzx81/typebox)

## Library

### Installation

```sh
# Using Bun
bun add @sinclair/typebox
```

### Usage

```ts
import { Static } from '@sinclair/typebox'

const status = t.Union([
  t.Literal('done'),
  t.Literal('pending'),
  t.Literal('in-progress'),
])

const product = t.Object({
  id: t.String(),
  name: t.String(),
  status,
})

export type Task = Static<typeof product>
```
