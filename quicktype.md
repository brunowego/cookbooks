# quicktype

## Links

- [Code Repository](https://github.com/quicktype/quicktype)

## CLI

### Installation

#### Homebrew

```sh
brew install quicktype
```

### Commands

```sh
quicktype -h
```

### Usage

```sh
#
echo '{ "name": "David" }' | quicktype -l csharp

#
enum TestEnum {
  Foo = "000",
  Bar = "001",
  Baz = "002"
}

quicktype \
  --src enum.ts \
  --lang typescript \
  --out out.ts \
  --just-types
```
