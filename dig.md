# Domain Information Groper (dig)

## Glossary

- Canonical Name (CNAME)
- Domain-based Message Authentication, Reporting, and Conformance (DMARC)
- DomainKeys Identified Mail (DKIM)
- Mail Exchanger (MX)
- Name Server (NS)
- Sender Policy Framework (SPF)
- Top Level Domain (TLD)

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
export DOMAIN='domain.tld'

#
dig "$DOMAIN" +short

#
dig "$DOMAIN" +short NS
# DNS Google
dig @8.8.8.8 "$DOMAIN" +short NS
# DNS Quad9
dig @9.9.9.9 "$DOMAIN" +short NS
# DNS Cloudflare
dig @1.1.1.1 "$DOMAIN" +short NS

#
dig grafana."$DOMAIN" +short CNAME

#
dig "$DOMAIN" +short MX

#
dig "$DOMAIN" +short -t txt

#
dig "$DOMAIN" +short A
```
