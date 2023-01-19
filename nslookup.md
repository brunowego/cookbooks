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
nslookup domain.tld

# Find NS records
nslookup -type=ns domain.tld

# Find SOA records
nslookup -type=soa domain.tld

# Find MX records
nslookup -query=mx domain.tld

# Find all available DNS
nslookup -type=any domain.tld

# Set port to connect
nslookup -port=56 domain.tld

# Set timeout interval
nslookup -timeout=20 domain.tld

# Debug
nslookup -debug domain.tld
```
