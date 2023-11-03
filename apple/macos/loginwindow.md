# Login Wwindow

## Configuration

### Login Hook

```sh
#
cat << EOF > /usr/local/bin/loginhook
#! /bin/bash

EOF

#
chmod +x /usr/local/bin/loginhook

#
loginhook

#
sudo defaults write com.apple.loginwindow LoginHook /usr/local/bin/loginhook

#
sudo defaults delete com.apple.loginwindow LoginHook
```

### Logout Hook

```sh
#
cat << EOF > /usr/local/bin/logouthook
#! /bin/bash

EOF

#
chmod +x /usr/local/bin/logouthook

#
logouthook

#
sudo defaults write com.apple.loginwindow LogoutHook /usr/local/bin/logouthook

#
sudo defaults delete com.apple.loginwindow LogoutHook
```
