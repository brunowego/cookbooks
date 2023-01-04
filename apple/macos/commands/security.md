# Security

## Commands

```sh
man security find-generic-password
```

## Usage

```sh
#
security find-generic-password -D 'Wi-Fi Network 5GHz' -a SSID -g

#
security find-generic-password -ga 'ROUTERNAME' | grep 'password:'

#
security find-generic-password -wga 'ROUTERNAME'

#
security find-generic-password -D '802.1X Password'
```

<!--
security find-certificate -a -c 'Apple Worldwide Developer Relations' -p ~/Library/Keychains/login.keychain-db
-->
