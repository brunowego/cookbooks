# Buf

**Keywords:** Protocol Buffers

## Links

- [Code Repository](https://github.com/bufbuild/buf)
- [Main Website](https://buf.build)

## Glossary

- Buf Schema Registry (BSR)

## CLI

### Installation

#### Homebrew

```sh
brew install buf
```

### Commands

```sh
buf -h
```

<!-- ### Usage

```sh
#
buf generate
``` -->

### Extend

#### With Trunk

```sh
# Run 'buf generate' anytime a .proto file changes
# Must have a buf.work.yaml to work properly
trunk actions enable buf-gen
```
