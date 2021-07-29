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
dig google.com

#
dig +short google.com

#
dig @8.8.8.8 google.com

#
dig -x 8.8.8.8

#
dig MX google.com

#
dig -t txt google.com

#
dig A +short google.com
```
