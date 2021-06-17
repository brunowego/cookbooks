# IntelliJ IDEA Community Edition (CE)

<!--
https://www.diffblue.com/community-edition/download/

https://medium.com/@m.muizzsuddin_25037/hot-reload-java-without-worry-with-dcevm-hotswap-in-intellijidea-472ba82f8121

https://app.pluralsight.com/library/courses/intellij-ce-getting-started/table-of-contents

https://linkedin.com/learning/intellij-idea-community-edition-essential-training-2
-->

## App

### Installation

#### Homebrew

```sh
brew install --cask intellij-idea-ce
```

### Configuration

```sh
# Git ignore
cat << EOF >> ~/.gitignore_global
/.idea
/*.iml
EOF
```

### Plugins

- [EditorConfig](https://plugins.jetbrains.com/plugin/7294-editorconfig)

### Tips

#### Whitespaces

View / Active Editor / Show Whitespaces

#### Project SDK

File / Project Structure / Project Settings / Project / Project SDK

#### HotSwap

- [HotSwapAgent](http://hotswapagent.org/mydoc_setup_intellij_idea.html)
- [DCEVM](https://dcevm.github.io/)

#### CLI

1. Tools
2. Create Command-line Launcher...

```sh
#
idea ./
```

#### Filesystem Case-Sensitivity

```sh
# Community Edition
echo 'idea.case.sensitive.fs=true' >> /Applications/IntelliJ\ IDEA\ CE.app/Contents/bin/idea.properties

# Enterprise Edition
echo 'idea.case.sensitive.fs=true' >> /Applications/IntelliJ\ IDEA.app/Contents/bin/idea.properties
```
