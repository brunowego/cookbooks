# Sourcetree

**Keywords:** Git GUI

## Links

- [Main Website](https://sourcetreeapp.com)

## App

### Installation

#### Homebrew

```sh
brew install --cask sourcetree
```

#### Linux

- [SourceTree for Linux](https://community.atlassian.com/t5/Sourcetree-questions/SourceTree-for-Linux/qaq-p/255473)
- [Alternatives to Sourcetree for Linux](https://alternativeto.net/software/sourcetree/?platform=linux)

#### Chocolatey

```sh
choco install -y sourcetree
```

### Tips

#### Dark theme

1. Preferences
2. General
3. Theme: Dark

<!-- ####

1. Preferences
2. General
3. Window restoration: Don't restore windows on startup -->

<!-- ####

1. Preferences
2. General
3. Terminal app: iTerm2 -->

<!-- ###

1. Preferences
2. General
3. Keep bookmarks closed on startup -->

### Issues

#### TBD

```log
You are opening the application “Sourcetree.app” for the first time. Are you sure you want to open this application?
The application is in a folder named “Applications.” To see the application in the Finder without opening it, click Show Application.
```

[Uninstall](#uninstall) Sourcetree and try a fresh install.

#### Missing Git CLI

```log
'git status' failed with code -1:'launch path not accessible
```

1. Preferences
2. Git tab
3. Git Version -> Use System Git

#### Authentication Required

```log
Authentication Required
For URL: https://[]/[].git
```

1. Sourcetree
2. Preferences...
   - Git tab
   - Git Version block -> Use System Git

### Uninstall

```sh
# Homebrew
brew uninstall --cask sourcetree

rm -fR "$HOME"/Library/Application\ Support/SourceTree
rm -fR "$HOME"/Library/Logs/SourceTree
```
