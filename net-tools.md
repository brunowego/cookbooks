# net-tools

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install net-tools
```

#### APT

```sh
sudo apt update
sudo apt -y install net-tools
```

### Commands

| Program | Obsoleted by |
| --- | --- |
| `arp` | `ip n` (`ip neighbor`) |
| `ifconfig` | `ip a` (`ip addr`), `ip link`, `ip -s` (`ip -stats`) |
| `iptunnel` | `ip tunnel` |
| `netstat` | `ss`, `ip route` (for `netstat-r`), `ip -s link` (for `netstat -i`), `ip maddr` (for `netstat-g`) |
| `route` | `ip r` (`ip route`) |
| `nameif` | `ip link` |
| `mii-tool` | `ethtool` |

### Usage

```sh
# Info
ip a

# Or
ifconfig

# Homebrew
ipconfig getifaddr en0

# Listening
netstat -an | grep -w 'LISTEN'
```
