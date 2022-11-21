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
dig <domain>

#
dig <domain> +short

#
dig <domain> NS

#
dig <domain> CNAME

#
dig @8.8.8.8 <domain>

#
dig -x 8.8.8.8

#
dig <domain> MX

#
dig <domain> -t txt

#
dig <domain> A +short

#
dig _dmarc.<domain> txt +noall +answer +short

#
dig +nocmd <domain> txt +multiline +noall +answer | awk -F '"' '/spf/{print $2}'
```

<!--
#
dig default._domainkey.<domain> txt +nocmd +short | awk -F '"|;|=|\\\\' '{print $9$11}'
-->
