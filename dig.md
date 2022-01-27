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
dig +short example.com

#
dig @8.8.8.8 example.com

#
dig -x 8.8.8.8

#
dig MX example.com

#
dig -t txt example.com

#
dig A +short example.com
```
