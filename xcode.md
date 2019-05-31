# Xcode

## Installation

### MAS

```sh
mas install 497799835
```

## Configuration

```sh
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license
```

## Tips

### iOS Development Certificate

```sh
open ios/Runner.xcworkspace
```

## Issues

### Agreeing License

> Agreeing to the Xcode/iOS license requires admin privileges, please re-run as root via sudo.

```sh
sudo xcodebuild -license
```

Or open Xcode and accept the terms.

### Tool `xcodebuild` Requires Xcode

> xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance

```sh
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```
