# OpenVPN Connect

**Keywords:** OpenVPN Client

## App

### Dependencies

- Ubuntu- Ubuntu
  - [cURL](/curl.md)
  - [GNU Privacy Guard (GnuPG / GPG) or GNU Pretty Good Privacy (PGP)](/gnu-pg.md)

### Installation

#### Homebrew

```sh
brew install --cask openvpn-connect
```

#### APT

```sh
curl -fsSL 'https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub' | sudo apt-key add -
sudo curl -so /etc/apt/sources.list.d/openvpn3.list 'https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-buster.list'

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install openvpn3
```

#### Chocolatey

```sh
choco install -y openvpn-connect
```
