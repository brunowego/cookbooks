# fastlane

**Keywords:** Mobile App Automation/Development, Useful for Pipelines (Portability)

![fastlane](/assets/images/fastlane/fastlane.png)

## Links

- [Code Repository](https://github.com/fastlane/fastlane)
- [Main Website](https://fastlane.tools)

## Docs

- [Continuous Integration](https://docs.fastlane.tools/best-practices/continuous-integration/)
- Plugins
  - [Available Plugins](https://docs.fastlane.tools/plugins/available-plugins)
- Advanced
  - [Fastfile](https://docs.fastlane.tools/advanced/Fastfile/)
- [Actions](./actions/README.md)

## Conferences

- [fastlane Best Practices](https://joshholtz.com/altconf-fastlane-best-practices/)

## CLI

### Dependencies

- [Xcode](/apple/xcode/README.md#cli)
- [Ruby](/ruby/README.md)
- [Bundler](/bundler.md#initialize)
- [CocoaPods](/cocoapods.md#bundler)

### Installation

#### Bundler 🌟

```sh
bundle add fastlane
```

#### Homebrew

**Tip:** Not recommended.

```sh
brew install fastlane
```

### Commands

```sh
bundle exec fastlane -h
# or, if installed with Homebrew
fastlane -h
```

### Initialize

```sh
#
bundle exec fastlane init

#
mv ./fastlane ./.fastlane

#
cat << EOF > ./.fastlane/.gitignore
/metadata
/screenshots
/test_output
/.env*
/report.xml
EOF
```

<!--
/Preview.html
/screenshots
/test_output
-->

### Usage

```sh
#
bundle exec fastlane list

#
bundle exec fastlane run <action>
```

### Tips

#### Opt Out Usage

```sh
#
bundle exec fastlane run opt_out_usage
```

#### Generate Documentation

```sh
#
bundle exec fastlane docs
```

#### Rubocop

**Refer:** `.rubocop.yml`

```yml
---
AllCops:
  Include:
    - .fastlane/Appfile
    - .fastlane/Fastfile
    # ...
  # ...
```

#### Debug

```sh
#
bundle exec fastlane env
```

#### Enable Auto Complete

```sh
#
bundle exec fastlane enable_auto_complete
```

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# fastlane
source ~/.fastlane/completions/completion.sh
```

```sh
source ~/.zshrc
```

### Issues

#### Missing Profiles

```log
error: exportArchive: No profiles for 'com.example.app' were found

Error Domain=IDEProfileLocatorErrorDomain Code=1 "No profiles for 'com.example.app' were found" UserInfo={IDEDistributionIssueSeverity=3, NSLocalizedDescription=No profiles for 'com.example.app' were found, NSLocalizedRecoverySuggestion=Xcode couldn't find any iOS App Store provisioning profiles matching 'com.example.app'. Automatic signing is disabled and unable to generate a profile. To enable automatic signing, pass -allowProvisioningUpdates to xcodebuild.}
```

```sh
#
ls -la ~/Library/MobileDevice/Provisioning\ Profiles

#
trash ~/Library/MobileDevice/Provisioning\ Profiles/*
```
