# CocoaPods

<!--
Podfile
-->

## Links

- [Code Repository](https://github.com/CocoaPods/CocoaPods)
- [Main Website](https://cocoapods.org/)

## CLI

### References

- [Getting Started](https://guides.cocoapods.org/using/getting-started.html)

### Installation

#### Homebrew

```sh
brew install cocoapods
```

#### RubyGems

```sh
gem install cocoapods
```

#### Bundler

```sh
bundler add cocoapods
```

### Commands

```sh
pod --help
```

### Initialize

```sh
#
pod init

#
pod setup
```

### Usage

```sh
#
pod env

#
pod repo list
pod repo update
pod repo update <name>

# Install Dependencies
pod install
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

pod setup
```

### Uninstall

```sh
# Homebrew
brew uninstall cocoapods

rm -fR ~/.cocoapods
```
