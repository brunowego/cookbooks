# Bitdefender

## References

- [Uninstall](https://bitdefender.com/consumer/support/answer/1784/)

## App

### Tips

#### Uninstall

```sh
# Homebrew
brew uninstall --cask bitdefender
```

```sh
rm -fR ~/Library/Application\ Support/Bitdefender
rm -fR ~/Library/Preferences/com.bitdefender.vpn.plist
rm -fR ~/Library/Caches/com.bitdefender.*
rm -fR ~/Library/Logs/Bitdefender
rm -fR ~/Library/Group\ Containers/*.group.com.bitdefender.vpn

open ~/Library/Containers # Delete all com.bitdefender.* folders
```

Open "Keychain Access" and delete bitdefender entry on login.

<!--
Need delete the account on the Bitdefender website.
-->
