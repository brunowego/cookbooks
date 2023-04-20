# Universally unique Lexicographically sortable IDentifier (ULID)

<!--
https://medium.com/zendesk-engineering/how-probable-are-collisions-with-ulids-monotonic-option-d604d3ed2de
-->

## References

- [Spec](https://github.com/ulid/spec)

## Tools

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
