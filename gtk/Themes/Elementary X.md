# Elementary X

## Dependencies

```sh
sudo apt -y install git
```

## Installation

```sh
git clone https://github.com/surajmandalcell/elementary-x.git ~/.themes/elementary-x
```

```sh
gsettings set org.gnome.desktop.interface gtk-theme 'elementary-x'
```

## Dark Mode

### Dependencies

```sh
sudo apt -y install vim
```

### Configuration

```sh
tee -a ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=1
EOF
```

## Icons

```sh
( cd ~/.themes/elementary-x && chmod +x install_fixed_icons.sh && ./install_fixed_icons.sh )
```

## Plank

```sh
mkdir -p ~/.local/share/plank/themes
```

```sh
( cd ~/.themes/elementary-x && chmod +x install_plank_themes.sh && ./install_plank_themes.sh )
```
