# fastlane

<!--
https://github.com/search?o=desc&q=filename%3AFastfile+%22ruby%22&s=indexed&type=Code

https://github.com/rakutentech/ios-buildconfig/blob/master/fastlane/Fastfile
https://github.com/DHBW-VS/app
https://github.com/joreilly/GalwayBus
https://github.com/Automattic/pocket-casts-ios/
-->

## Links

- [Code Repository](https://github.com/fastlane/fastlane)
- [Main Website](https://fastlane.tools)

## Docs

- [Fastfile](https://docs.fastlane.tools/advanced/Fastfile/)
- [testflight](https://docs.fastlane.tools/actions/testflight/)
- [Supply / Setup](https://docs.fastlane.tools/actions/supply/#setup)

## CLI

### Installation

#### Homebrew

```sh
brew install fastlane
```

#### RubyGems

```sh
bundle init
bundle add fastlane
```

### Commands

```sh
fastlane -h
bundle exec fastlane -h
```

### Configuration

```sh
#
fastlane run opt_out_usage
```

### Initialize

```sh
#
fastlane init

#
fastlane docs
```

### Usage

```sh
#
fastlane env

#
fastlane actions

#
fastlane list

#
fastlane run <action>
fastlane run testflight
```

### Tips

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
