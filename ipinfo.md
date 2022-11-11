# IPinfo.io

<!--
https://ipstack.com/
-->

**Keywords:** Geolocation

## Links

- [Code Repository](https://github.com/ipinfo/cli)
- [Main Website](https://ipinfo.io)

## Glossary

- Internet Service Provider (ISP)

## CLi

### Installation

#### Homebrew

```sh
brew install ipinfo-cli
```

### Commands

```sh
ipinfo -h
```

### Initialize

```sh
#
ipinfo login
```

### Usage

```sh
#
ipinfo myip -f ip | ipinfo map

#
ipinfo map 157.240.194.0/24

#
ipinfo map 8.8.8.0-8.8.8.255

#
cat << EOF | ipinfo map
127.110.160.148
191.172.131.23
185.123.6.232
8.207.28.128
...
86.234.165.133
128.131.1.21
164.81.151.182
44.98.78.106
219.137.168.161
EOF

#
dig +short stackoverflow.com | ipinfo map

#
ipinfo map 20.54.0.0/24 69.63.187.0/24
```
