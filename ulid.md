# Universally unique Lexicographically sortable IDentifier (ULID)

<!--
https://medium.com/zendesk-engineering/how-probable-are-collisions-with-ulids-monotonic-option-d604d3ed2de
-->

**Keywords:** Identification (ID)

## References

- [Spec](https://github.com/ulid/spec)

## Tools

- [ulid.page](https://ulid.page) (Decoded time (ISO))
- [ULID Generator](https://ulidgenerator.com)

## CLI

### Installation

#### go install

```sh
GOBIN=/usr/local/bin go install github.com/oklog/ulid/v2/cmd/ulid@latest
```

### Commands

```sh
ulid -h
```

### Usage

```sh
#
ulid

#
ulid -z
```

<!--
import { ulid } from 'ulidx'

export const generateId = (): string => ulid()
-->

<!--
import { ulid } from 'ulidx'

const prefixes = ['usr'] as const

export type Prefix = (typeof prefixes)[number]

export const generatePrefixedId = ({
  prefix,
}: { prefix: (typeof prefixes)[number] }): string => `${prefix}_${ulid()}`
-->
