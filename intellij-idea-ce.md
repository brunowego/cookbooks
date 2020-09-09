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
cat << EOF >> ~/.gitignore_global
/.idea
/*.iml
EOF
```

### Tips

#### CLI

1. Tools
2. Create Command-line Launcher...

```sh
idea .
```

#### Filesystem Case-Sensitivity

```sh
# Community Edition
echo 'idea.case.sensitive.fs=true' >> /Applications/IntelliJ\ IDEA\ CE.app/Contents/bin/idea.properties

# Enterprise Edition
echo 'idea.case.sensitive.fs=true' >> /Applications/IntelliJ\ IDEA.app/Contents/bin/idea.properties
```

<!-- ### Docs

####

1. Add Configuration... -->
