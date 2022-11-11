# Domain Information Groper (dig)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install dnsutils
```

### Commands

```sh
dig -h
```

### Usage

```sh
#
dig example.com

#
dig example.com +short

#
dig example.com NS

#
dig example.com CNAME

#
dig @8.8.8.8 example.com

#
dig -x 8.8.8.8

#
dig example.com MX

#
dig example.com -t txt

#
dig example.com A +short
```
