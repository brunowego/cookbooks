# nslookup

## Commands

```sh
man nslookup
```

## Usage

```sh
# Find A record
nslookup example.com

# Find NS records
nslookup -type=ns example.com

# Find SOA records
nslookup -type=soa example.com

# Find MX records
nslookup -query=mx example.com

# Find all available DNS
nslookup -type=any example.com

# Set port to connect
nslookup -port=56 example.com

# Set timeout interval
nslookup -timeout=20 example.com

# Debug
nslookup -debug example.com
```
