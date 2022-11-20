# iOS Development Bridge (idb)

## Links

- [Code Repository](https://github.com/facebook/idb)
- [Main Website](https://fbidb.io/)
- [Docs](https://fbidb.io/docs/overview)

## Glossary

- Unique Disability ID (UDID)

## CLI

### Installation

#### Homebrew

```sh
brew tap facebook/fb
brew install idb-companion
pip3 install fb-idb
```

### Commands

```sh
idb -h
```

### Usage

```sh
#
idb list-targets

#
export IDB_UDID='<udid>'

#
idb boot "$IDB_UDID"

#
idb describe --udid "$IDB_UDID"

#
idb list-apps --udid "$IDB_UDID"

#
idb launch com.apple.mobilesafari

#
idb record

#
idb log
```

<!--
#
idb terminate com.apple.Maps

#
idb disconnect "$IDB_UDID"
-->
