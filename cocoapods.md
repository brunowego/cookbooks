# CocoaPods

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

### Commands

```sh
pod -v
```

### Usage

```sh
# Version
pod --version

#
pod init

#
pod setup

#
pod repo update master

# Install Dependencies
pod install
```

### Issues

####

```log
Setting up CocoaPods master repo
fatal: not a git repository (or any of the parent directories): .git
[!] Unable to add a source with url `https://github.com/CocoaPods/Specs.git` named `master-1`.
You can try adding it manually in `~/.cocoapods/repos` or via `pod repo add`.
```

```sh
rm -fR ~/.cocoapods/repos/master

pod setup
```

### Uninstall

```sh
# Homebrew
brew uninstall cocoapods
```

```sh
rm -fR ~/.cocoapods
```
