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

Create git repository called `fastlane-cert-match-store` on your [Git Service](/git/git-service.md).

### Commands

```sh
bundle exec fastlane match -h
```

### Initialize

```sh
bundle exec fastlane match init
```

### Usage

```sh
#
bundle exec fastlane match adhoc # appstore, enterprise, development

#
bundle exec fastlane match nuke adhoc # appstore, enterprise, development
```
