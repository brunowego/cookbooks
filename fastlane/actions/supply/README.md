# supply

Command line tool for updating Android apps and their metadata on the Google Play Store.

## Links

- [Code Repository](https://github.com/fastlane/fastlane/tree/master/supply)
- [Docs](https://docs.fastlane.tools/actions/supply/)

## CLI

### Commands

```sh
bundle exec fastlane supply -h
```

### Initialize

```sh
#
bundle exec fastlane run validate_play_store_json_key json_key:'</path/to/file.json>'

#
bundle exec fastlane supply init
```

### Usage

```sh
#
bundle exec fastlane supply
```

### Issues

#### TBD

```log
[17:23:20]: Google Api Error: Invalid request - The caller does not have permission
[17:23:20]: Setting up `supply` (metadata management action) failed, but don't worry, you can try setting it up again using `fastlane supply init` whenever you want.
```

TODO
