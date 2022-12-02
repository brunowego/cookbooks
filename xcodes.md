# xcodes

## Links

- [Code Repository](https://github.com/RobotsAndPencils/xcodes)

## CLI

### Installation

#### Homebrew

```sh
brew tap robotsandpencils/made
brew install xcodes
```

### Commands

```sh
xcodes -h
```

### Configuration

```sh
#
xcodes update --data-source apple
```

### Usage

```sh
#
xcodes installed
xcodes runtimes

#
xcodes list

#
xcodes install --latest --experimental-unxip
xcodes install <version> --experimental-unxip

# or
xcodes download <version>

#
xcodes select

#
xcodes update <version>

#
xcodes uninstall <version>
```

<!--
"$HOME"/Library/Application\ Support/com.robotsandpencils.xcodes
-->

### Issues

#### Missing Authentication

```log
(1/6) Found existing archive that will be used for installation at ~/Library/Application Support/com.robotsandpencils.xcodes/Xcode-13.4.1+13F100.xip.
(2/6) Unarchiving Xcode (This can take a while)
Using regular unxip. Try passing `--experimental-unxip` for a faster unxip process
The archive "Xcode-13.4.1+13F100.xip" is damaged and can't be expanded.
Removing damaged XIP and re-attempting installation.
```

Run [configuration](#configuration) instructions.
