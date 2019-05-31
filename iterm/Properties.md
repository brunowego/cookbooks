# Properties

## Disable warning when quitting

```sh
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
```

##

```sh
defaults write com.googlecode.iterm2 AboutToPasteTabsWithCancel -bool false
```

## Tab

```sh
/usr/libexec/PlistBuddy -c 'Add :TabViewType integer 1' ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Name

```sh
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:Name $(id -F)" ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Reuse previous session directory

```sh
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Custom Directory" Recycle' ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Unlimited scrollback

```sh
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Unlimited Scrollback" true' ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Silence bell

```sh
/usr/libexec/PlistBuddy -c 'Set "New Bookmarks":0:"Silence Bell" true' ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Transparency

```sh
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Transparency" 0.03' ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Pane dimming

```sh
/usr/libexec/PlistBuddy -c 'Add :SplitPaneDimmingAmount real 0.100000' ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Toggle Broadcast

```sh
/usr/libexec/PlistBuddy -c 'Add :GlobalKeyMap:0x63-0x180000 dict' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Add :GlobalKeyMap:0x63-0x180000:Action integer 25' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Add :GlobalKeyMap:0x63-0x180000:Text string 'Toggle Broadcast Input to Current Session
Broadcast Input.Toggle Broadcast Input to Current Session'" ~/Library/Preferences/com.googlecode.iterm2.plist
```

## Save

```sh
/usr/libexec/PlistBuddy -c 'Save' ~/Library/Preferences/com.googlecode.iterm2.plist
```
