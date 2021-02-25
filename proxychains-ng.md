# ProxyChains-NG

## CLI

### Installation

#### Homebrew

```sh
brew install proxychains-ng
```

#### APT

```sh
sudo apt update
sudo apt -y install proxychains4
```

#### YUM

```sh
yum check-update
sudo yum -y install proxychains
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y proxychains-ng
```

### Standardization

```sh
# Ubuntu
sudo ln -s /usr/bin/proxychains4 /usr/local/bin/proxychains

# Darwin
sudo ln -s /usr/local/bin/proxychains4 /usr/local/bin/proxychains
```

### Configuration

```sh
#
mkdir -p ~/.proxychains

#
cat << EOF > ~/.proxychains/proxychains.conf
strict_chain

proxy_dns

tcp_read_time_out 15000
tcp_connect_time_out 8000

localnet 127.0.0.0/255.0.0.0

[ProxyList]
http   127.0.0.1 8080 [username] [password]
socks4 127.0.0.1 1080 [username] [password]
socks5 127.0.0.1 1080 [username] [password]
EOF
```

### Usage

```sh
#
curl -I github.com

proxychains -q curl -I github.com

#
nmap -p 80,443 github.com

proxychains -q nmap \
  -p 80,443 \
  github.com
```

### Issues

<!-- ####

```log
dyld: warning: could not load inserted library '/usr/local/Cellar/proxychains-ng/4.14/lib/libproxychains4.dylib' into hardened process because no suitable image found.  Did find:
	/usr/local/Cellar/proxychains-ng/4.14/lib/libproxychains4.dylib: code signature in (/usr/local/Cellar/proxychains-ng/4.14/lib/libproxychains4.dylib) not valid for use in process using Library Validation: mapped file has no cdhash, completely unsigned? Code has to be at least ad-hoc signed.
	/usr/local/Cellar/proxychains-ng/4.14/lib/libproxychains4.dylib: stat() failed with errno=1
```

```sh
# Enter the recovery mode of the system.
# Restart the computer and press: Command + R

# Disable SIP
csrutil disable
reboot

# Uninstall the old proxychains after restart
brew tap beeftornado/rmtree
brew rmtree proxychains-ng

# Reinstall
proxychains-ng --universal

# Confirm whether the configuration of proxychains-ng is correct, if not, then configure proxychains.conf
# Confirm whether telnet is normal
proxychains4 telnet google.com 80

# Try pod update again
proxychains4 pod update

# The problem remains: code signing blocked mmap()
``` -->
