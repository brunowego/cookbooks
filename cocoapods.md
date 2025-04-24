# CocoaPods

<!--
Podfile
-->

## Links

- [Code Repository](https://github.com/CocoaPods/CocoaPods)
- [Main Website](https://cocoapods.org)

## CLI

### References

- [Getting Started](https://guides.cocoapods.org/using/getting-started.html)

## Dependencies

- [rbenv](/rbenv.md) <!-- Ruby v3.2.2 -->

### Installation

```sh
# Using Bundler
gem install cocoapods
```

### Commands

```sh
bundle -h
```

### Initialize

```sh
#
bundle exec pod init

#
bundle exec pod setup
```

### Usage

```sh
#
bundle exec pod env

#
bundle exec pod repo list
bundle exec pod repo update
bundle exec pod repo update <name>

# Install Dependencies
bundle exec pod install
```

<!--
xcodebuild -exportArchive -exportOptionsPlist ios/exportOptionsUpload.plist -archivePath build/ios/archive/Runner.xcarchive -exportPath build/ios/release/
xcrun altool --validate-app -t ios -f build/ios/release/app.ipa -u "$CONNECT_USERNAME" -p "$CONNECT_PASSWORD"
xcrun altool --upload-app -t ios -f build/ios/release/app.ipa -u "$CONNECT_USERNAME" -p "$CONNECT_PASSWORD"
-->

### Issues

#### Missing Repos

```log
Setting up CocoaPods master repo
fatal: not a git repository (or any of the parent directories): .git
[!] Unable to add a source with url `https://github.com/CocoaPods/Specs.git` named `master-1`.
You can try adding it manually in `~/.cocoapods/repos` or via `pod repo add`.
```

```sh
#
rm -fR ~/.cocoapods/repos/master

bundle exec pod setup
```

### Uninstall

```sh
# Homebrew
brew uninstall cocoapods

rm -fR ~/.cocoapods
```
