# GSettings

## Usage

### List

```sh
# Relocatable Schemas
gsettings list-relocatable-schemas

# Keys
gsettings list-keys org.gnome.Terminal.Legacy.Profile:/ | grep default
```

### Terminal

```sh
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
gsettings set org.gnome.Terminal.Legacy.Profile background-color

export _uuid=$(gsettings get org.gnome.Terminal.ProfilesList default|sed "s/'//g")

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${_uuid}/ use-theme-colors false
gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${_uuid}/ background-color
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${_uuid}/ background-color '#282c34'

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${_uuid}/ use-transparent-background true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${_uuid}/ background-transparency-percent 7
```

### Desktop

```sh
# Interface
gsettings set org.gnome.desktop.interface enable-animations false

# Session
gsettings set org.gnome.desktop.session idle-delay 0

# Background
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.desktop.background picture-uri none
gsettings set org.gnome.desktop.background primary-color '#282c34'
gsettings set org.gnome.desktop.background secondary-color '#282c34'
# gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/wallpapers/wallpapers/bls_wallpaper.png'
# gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/wallpapers/wallpapers/bls_wallpaper.png'
gsettings set org.gnome.desktop.background picture-options scaled

# gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots 'false'
```

### Shell

```sh
gsettings get org.gnome.shell favorite-apps
```

### SessionManager

```sh
gsettings set org.gnome.SessionManager logout-prompt false
```

### Settings Daemon

```sh
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
```
