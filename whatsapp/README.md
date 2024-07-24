# WhatsApp

<!--
https://github.com/sarthakjdev/wapi.js
https://github.com/EvolutionAPI/evolution-api

https://wa.me/<number>

https://devzapp.com.br
https://campanhas.octadesk.com/whatsapp/whatsapp-comercial
https://digital.blip.ai/whatsapp/chatbot
https://pinkapp.com | https://my.pinkapp.com/conheca-o-produto-top-o
https://zapper.to
https://clint.digital/crm-whatsapp-instagram
-->

## Links

- [WhatsApp Status](https://twitter.com/wa_status?lang=en)
- [Web Version](https://web.whatsapp.com)

## App

### Installation

#### Homebrew

```sh
brew install --cask whatsapp
```

#### Chocolatey

```sh
choco install -y whatsapp
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
