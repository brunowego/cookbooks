# DomainKeys Identified Mail (DKIM)

## Checking

```sh
#
export DOMAIN='<domain>'

#
dig mail._domainkey."$DOMAIN" txt +nocmd +short | awk -F '"|;|=|\\\\' '{print $9$11}'
```
