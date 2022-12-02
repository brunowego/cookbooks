# match

<!--
https://www.wafrat.com/fixing-ios-distribution-certificate-related-errors/
-->

**Keywords:** Code Signing

## Links

- [Code Repository](https://github.com/fastlane/fastlane/tree/master/match)
- [Docs](https://docs.fastlane.tools/actions/match/)

## Related

- [Code Signing Guide for Teams](https://codesigning.guide/)

## CLI

### Dependencies

Git repository called `fastlane-cert-match-store`.

### Commands

```sh
fastlane match -h
```

### Initialize

```sh
fastlane match init
```

### Usage

```sh
#
fastlane match adhoc # appstore, development, enterprise

#
fastlane match nuke <name>
```
