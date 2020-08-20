# FortiClient

## App

### Installation

#### Homebrew

```sh
brew cask install forticlient
```

<!-- ### Tips

#### Disable Auto Start

https://sibunglon.com/2019/12/29/disable-forticlient-auto-start-on-macos/

```sh
sudo defaults write /Library/LaunchAgents/com.fortinet.forticlient.fct_launcher.plist RunAtLoad -boolean false
``` -->

<!-- ## Docker

https://github.com/alvsanand/forticlient-vpn-docker

```sh
docker run --rm -it \
  --privileged \
  --name fortisslvpn \
  --env="DISPLAY" \
  --env="LC_ALL=C" \
  --env="QT_X11_NO_MITSHM=1" \
  -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  -v <PATH_TO_CPN_HISTORY_CONFIG_FILE>:/root/.fctsslvpnhistory \
  -v <PATH_TO_CERTIFICATE>:/opt/cer.p12 \
  -p 3128:3128
  alvsanand/forticlient-vpn-docker
``` -->
