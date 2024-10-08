# iTerm2

**Keyword:** Terminal

## App

### Installation

#### Homebrew

```sh
brew install --cask iterm2
```

### Run First Time

```sh
open -a /Applications/iTerm.app
osascript -e 'quit app "iTerm"'
```

### Properties

```sh
# Disable warning when quitting
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

#
defaults write com.googlecode.iterm2 AboutToPasteTabsWithCancel -bool false

# Tab
/usr/libexec/PlistBuddy -c 'Add :TabViewType integer 1' ~/Library/Preferences/com.googlecode.iterm2.plist

# Name
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:Name $(id -F)" ~/Library/Preferences/com.googlecode.iterm2.plist

# Reuse previous session directory
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Custom Directory" Recycle' ~/Library/Preferences/com.googlecode.iterm2.plist

# Unlimited scrollback
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Unlimited Scrollback" true' ~/Library/Preferences/com.googlecode.iterm2.plist

# Silence bell
/usr/libexec/PlistBuddy -c 'Set "New Bookmarks":0:"Silence Bell" true' ~/Library/Preferences/com.googlecode.iterm2.plist

# Transparency
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Transparency" 0.1' ~/Library/Preferences/com.googlecode.iterm2.plist

# Pane dimming
/usr/libexec/PlistBuddy -c 'Add :SplitPaneDimmingAmount real 0.100000' ~/Library/Preferences/com.googlecode.iterm2.plist

# Toggle Broadcast
/usr/libexec/PlistBuddy -c 'Add :GlobalKeyMap:0x63-0x180000 dict' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Add :GlobalKeyMap:0x63-0x180000:Action integer 25' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Add :GlobalKeyMap:0x63-0x180000:Text string 'Toggle Broadcast Input to Current Session
Broadcast Input.Toggle Broadcast Input to Current Session'" ~/Library/Preferences/com.googlecode.iterm2.plist

#
/usr/libexec/PlistBuddy -c "Add :DefaultURLScheme string 'http'" ~/Library/Preferences/com.googlecode.iterm2.plist

# Save
/usr/libexec/PlistBuddy -c 'Save' ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Tips

#### Backup Folders

```sh
# MacOS
ls "$HOME"/Library/Application\ Support/iTerm2
ls "$HOME"/Library/Preferences/com.googlecode.iterm2.*
```

#### Stop Process

**Note:** Never use `Control (⌃) + Z` (suspend)

Use `Control (⌃) + C`

#### Default URL Scheme

1. Preferences
2. Advanced Tab
3. Semantic History -> Default URL scheme

#### Open With

**Visual Studio Code**

1. Preferences
2. Profiles
3. Advanced -> Semantic History
   - Select: `Run command...`
   - Type: `/usr/local/bin/code -g \1:\2`

#### Shortcuts

- `⌘` Command
- `⇧` Shift
- `⌥` Option
- `⌃` Control
- `↩︎` Return/Enter

- `Command + k` Clear Buffer

### Issues

#### Disable Shell Integration

```log
Looks like paste bracketing was left on when an ssh session ended unexpectedly or an app misbehaved. Turn it off?
```

1. iTerm -> Preferences...
2. Profiles -> Select Profile
3. Terminal Tab -> Shell Integration Session
   - Uncheck "Insert newline before start of command prompt if needed"
   - Uncheck "Show mark indicators"

#### Remove Prompt %

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Remove '%' in first line with the prompt
unsetopt PROMPT_SP
```

#### Disable Session Contests Restored

```log
Session Contents Restored on Sep 16, 2022 at 4:52 PM
```

1. iTerm2 -> Preferences...
2. Advanced Tab
3. Session Section -> When restoring a session without restoring a running job, draw a banner saying "Session Contests Restored" below the restored contents -> Select "No"

#### Window Restoration Disabled

System window restoration has been disabled, which prevents iTerm2 from respecting this setting. Disable System Preferences > General > Close windows when quitting an app to enable window restoration.

### Uninstall

```sh
brew uninstall --cask iterm2
```

## Docs

### Arrangement

1. Window -> Save Window Arrangement
   - Name for saved window arrangement: Productive
2. Window -> Restore Window Arrangement

Edit

1. iTerm2
2. Preferences...
3. Arrangements
