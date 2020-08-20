# IntelliJ IDEA Community Edition

## App

### Installation

#### Homebrew

```sh
brew cask install intellij-idea-ce
```

### Configuration

```sh
# Git ignore
echo '.idea' >> ~/.gitignore_global
```

### Tips

#### CLI

1. Tools
2. Create Command-line Launcher...

#### Filesystem Case-Sensitivity

```sh
echo 'idea.case.sensitive.fs=true' >> /Applications/IntelliJ\ IDEA.app/Contents/bin/idea.properties
```
