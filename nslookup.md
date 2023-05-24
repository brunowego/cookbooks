# nslookup

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install dnsutils
```

### Commands

```sh
man nslookup
```

### Usage

```sh
# Find A record
nslookup xyz.tld

# Find NS records
nslookup -type=ns xyz.tld

# Find SOA records
nslookup -type=soa xyz.tld

# Find MX records
nslookup -query=mx xyz.tld

# Find all available DNS
nslookup -type=any xyz.tld

# Set port to connect
nslookup -port=56 xyz.tld

# Set timeout interval
nslookup -timeout=20 xyz.tld

# Debug
nslookup -debug xyz.tld
```
