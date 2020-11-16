# SwitchHosts!

## App

### Dependencies

#### Linux

- [bsdtar](/bsdtar.md)
- [cURL](/curl.md)

### Installation

#### Homebrew

```sh
brew cask install switchhosts
```

#### Linux

```sh
#
sudo mkdir -p /usr/local/switchhosts && \
  curl -L "$(curl -ks https://api.github.com/repos/oldj/SwitchHosts/releases/latest | grep browser_download_url | grep _linux_x64 | cut -d '"' -f 4)" | \
    sudo bsdtar -xf - -C /usr/local/switchhosts

#
sudo chmod +x /usr/local/switchhosts/switchhosts
```

##### Ubuntu Desktop Entry

```sh
#
sudo curl \
  -o /usr/local/switchhosts/default4x.png \
  https://raw.githubusercontent.com/oldj/SwitchHosts/master/app/assets/logo%404x.png

#
mkdir -p ~/Desktop

#
cat << EOF > ~/Desktop/SwitchHosts.desktop
[Desktop Entry]
Name=SwitchHosts!
GenericName=SwitchHosts!
Exec=/usr/local/switchhosts/switchhosts %u
Terminal=false
Icon=/usr/local/switchhosts/default4x.png
Type=Application
Categories=Application;Network;X-Developer;
Comment=SwitchHosts! is an App for hosts management & switching.
EOF
```

<!-- #### Chocolatey

```sh
# https://github.com/oldj/SwitchHosts/issues/502
choco install -y switchhosts
``` -->
