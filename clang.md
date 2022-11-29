# Clang

## CLI

### Installation

#### Homebrew

```sh
brew install hdf5 c-blosc
```

#### YUM

```sh
yum check-update
sudo yum -y install clang
```

### Usage

```sh
# Version
clang++ --version | head -1
```

### Issues

#### Missing Xcode Run Fist Launch

```log
xcode-select: Failed to locate 'clang', requesting installation of command line developer tools.
```

```sh
sudo xcodebuild -runFirstLaunch
```

#### Error Exit

```log
error: command 'clang' failed with exit status 1
```

TODO
