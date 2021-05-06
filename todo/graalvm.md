# GraalVM

## References

- [HotSpot](/hotspot.md)
- Substrate VM
- Ahead-of-time compilation (AOT)
- Just-In-Time (JIT)
- Truffle Framework
- Sulong (LLVM)

<!--
https://www.linkedin.com/learning/java-microservices-with-graalvm/running-java-faster-with-graalvm
-->

## CLI

### Installation

#### Homebrew

```sh
#
brew tap graalvm/tap

#
brew install --cask graalvm-ce-java8
brew install --cask graalvm-ce-java11
brew install --cask graalvm-ce-java16
```

#### jabba

```sh
jabba install graalvm-ce-java11@21.1.0
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# GraalVM from Homebrew
export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/graalvm-ce-java11-21.1.0/Contents/Home"
export PATH="$GRAALVM_HOME/bin:$PATH"

# GraalVM from jabba
export GRAALVM_HOME="$(jabba which graalvm-ce-java11@21.1.0)/Contents/Home"
export PATH="$GRAALVM_HOME/bin:$PATH"
```

#### macOS Catalina

```sh
# GraalVM from Homebrew
xattr -r -d com.apple.quarantine ${GRAALVM_HOME}/../..
```

### Commands

```sh
gu --help
```

### Usage

```sh
#
gu list

#
gu install native-image
gu install python
gu install ruby
gu install R
gu install wasm # WebAssembly
```
