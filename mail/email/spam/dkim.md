# DomainKeys Identified Mail (DKIM)

## Tools

- [MxToolbox - DKIM Record Lookup](https://mxtoolbox.com/dkim.aspx)

## Checking

```sh
#
export DOMAIN='<domain>'

#
dig mail._domainkey."$DOMAIN" txt +nocmd +short | awk -F '"|;|=|\\\\' '{print $9$11}'
```
