# Linux

| Program | Obsoleted by |
| --- | --- |
| `arp` | `ip n` (`ip neighbor`) |
| `ifconfig` | `ip a` (`ip addr`), `ip link`, `ip -s` (`ip -stats`) |
| `iptunnel` | `ip tunnel` |
| `netstat` | `ss`, `ip route` (for `netstat-r`), `ip -s link` (for `netstat -i`), `ip maddr` (for `netstat-g`) |
| `route` | `ip r` (`ip route`) |
| `nameif` | `ip link` |
| `mii-tool` | `ethtool` |

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install net-tools
```

### APT

```sh
sudo apt update
sudo apt -y install net-tools
```
