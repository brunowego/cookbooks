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
- Download
  - [OpenVPN Connect for Windows](https://openvpn.net/client-connect-vpn-for-windows)
  - [OpenVPN Connect for Windows](https://openvpn.net/client-connect-vpn-for-mac-os)

## Glossary

- Cool Other Package Repo (COPR)

## App

### Dependencies

- Ubuntu- Ubuntu
  - [cURL](/curl.md)
  - [GNU Privacy Guard (GnuPG / GPG) or GNU Pretty Good Privacy (PGP)](/gnu/pg.md)

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

#### YUM

```sh
yum check-update

sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install yum-plugin-copr
sudo yum -y copr enable dsommers/openvpn3

sudo yum -y install openvpn3-client
```

#### Chocolatey

```sh
choco install -y openvpn-connect
```

### Usage

#### Linux

```sh
#
openvpn3 config-import --config <filename>.ovpn

#
openvpn3 configs-list

#
openvpn3 session-start --config-path /net/openvpn/v3/configuration/<profile>

#
openvpn3 sessions-list

#
openvpn3 session-manage \
  --disconnect \
  --config-path /net/openvpn/v3/configuration/<profile>
```

### Issues

#### TBD

```log
session-start: ** ERROR ** User authentication failed
```

TODO

#### TBD

```log
Options error: Unrecognized option or missing or extra parameter(s) in <filename>.ovpn:4: data-ciphers (2.4.4)
```

TODO
