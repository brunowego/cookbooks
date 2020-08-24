# Telegram

## App

### Installation

#### Homebrew

```sh
brew cask install telegram
```

### Tips

#### Force Specific Network Interface

```sh
# List
netstat -rn | grep -i default

# Route Info
route get web.telegram.org
route get pluto.web.telegram.org

# Add Route
sudo route add 149.154.167.99 172.20.10.1
sudo route add 149.154.175.204 172.20.10.1

#
netstat -rn | grep -i 149.154.167.99
netstat -rn | grep -i 149.154.175.204

# Check Route
route get web.telegram.org
route get pluto.web.telegram.org

# Delete
sudo route delete 149.154.167.99 172.20.10.1
sudo route delete 149.154.175.204 172.20.10.1
```

### Issues

#### Proxy

Bypass external proxies for the following hosts:

```txt
*.telegram.org
```
