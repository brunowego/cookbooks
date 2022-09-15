# iTerm2

## App

### Installation

#### Homebrew

```sh
brew install --cask iterm2
```

### Properties

```sh
open -a /Applications/iTerm.app
osascript -e 'quit app "iTerm"'
```

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
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Transparency" 0.05' ~/Library/Preferences/com.googlecode.iterm2.plist

# Pane dimming
/usr/libexec/PlistBuddy -c 'Add :SplitPaneDimmingAmount real 0.100000' ~/Library/Preferences/com.googlecode.iterm2.plist

# Toggle Broadcast
/usr/libexec/PlistBuddy -c 'Add :GlobalKeyMap:0x63-0x180000 dict' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Add :GlobalKeyMap:0x63-0x180000:Action integer 25' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Add :GlobalKeyMap:0x63-0x180000:Text string 'Toggle Broadcast Input to Current Session
Broadcast Input.Toggle Broadcast Input to Current Session'" ~/Library/Preferences/com.googlecode.iterm2.plist

# Save
/usr/libexec/PlistBuddy -c 'Save' ~/Library/Preferences/com.googlecode.iterm2.plist
```

### Tips

#### Stop Process

**Note:** Never use `Control (⌃) + Z` (suspend)

Use `Control (⌃) + C`

#### Default URL Scheme

1. Preferences
2. Advanced Tab
3. Semantic History -> Default URL scheme

#### Open With

##### Visual Studio Code

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
