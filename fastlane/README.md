# fastlane

<!--
https://github.com/icyleaf/icyleaf.com/blob/master/content/posts/2016-07-11-intro-fastlane-automation-for-ios-and-android.md

https://github.com/ittybittyapps/appstoreconnect-cli
-->

<!--
https://github.com/search?o=desc&q=filename%3AFastfile+%22ruby%22&s=indexed&type=Code

https://github.com/rakutentech/ios-buildconfig/blob/master/fastlane/Fastfile
https://github.com/DHBW-VS/app
https://github.com/joreilly/GalwayBus
https://github.com/Automattic/pocket-casts-ios/
-->

![fastlane](/assets/images/fastlane/fastlane.png)

## Links

- [Code Repository](https://github.com/fastlane/fastlane)
- [Main Website](https://fastlane.tools)

## Docs

- Plugins
  - [Available Plugins](https://docs.fastlane.tools/plugins/available-plugins)
- Advanced
  - [Fastfile](https://docs.fastlane.tools/advanced/Fastfile/)
- Actions
  - [Supply](https://docs.fastlane.tools/actions/supply/)
  - [testflight](https://docs.fastlane.tools/actions/testflight/)

## Conferences

- [fastlane Best Practices](https://www.joshholtz.com/altconf-fastlane-best-practices/)

## CLI

### Installation

#### Homebrew

```sh
brew install fastlane
```

#### RubyGems

```sh
bundle add fastlane
```

### Commands

```sh
fastlane -h
bundle exec fastlane -h
```

### Initialize

```sh
#
fastlane init

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
fastlane list

#
fastlane run <action>
```

### Tips

#### Opt Out Usage

```sh
#
fastlane run opt_out_usage
```

#### Generate Documentation

```sh
#
fastlane docs
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
fastlane env
```

#### Enable Auto Complete

```sh
#
fastlane enable_auto_complete
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
