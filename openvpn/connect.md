# OpenVPN Connect

**Keywords:** OpenVPN Client

<!--
.ovpn
-->

<!--
https://www.slickvpn.com/tutorials/using-openvpn-with-ubuntu-mint-network-manager/
-->

## Links

- [OpenVPN 3 Client for Linux](https://openvpn.net/cloud-docs/openvpn-3-client-for-linux/)
- [Connecting to Access Server with Linux](https://openvpn.net/vpn-server-resources/connecting-to-access-server-with-linux/)

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

<!-- #### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install openvpn3-client
``` -->

#### Chocolatey

```sh
choco install -y openvpn-connect
```
