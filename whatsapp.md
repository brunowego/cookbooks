# WhatsApp

## App

### Installation

#### Homebrew

```sh
brew cask install whatsapp
```

### Tips

#### Force Specific Network Interface

```sh
# List
netstat -rn | grep -i default

# Route Info
route get web.whatsapp.com

#
export IP=$(nslookup web.whatsapp.com | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')

# Add Route
sudo route add "$IP" 172.20.10.1

# Check
netstat -rn | grep -i "$IP"

# Delete
sudo route delete [ip] 172.20.10.1
```

### Issues

#### Proxy

Bypass external proxies for the following hosts:

```txt
*.whatsapp.com
```
