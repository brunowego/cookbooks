# Simple Mail Transfer Protocol (SMTP)

<!--
https://github.com/hideckies/exploit-notes/blob/main/src/exploit/SMTP-Pentesting.md
-->

## References

- [SMTP transport example](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol#SMTP_transport_example)

## Glossary

- Top-Level Domain (TLD)

## Connections

| Port | Security    |
| ---- | ----------- |
| 25   | Unencrypted |
| 465  | SSL         |
| 587  | TLS         |

## Configuration

### DNS

```sh
#
export DOMAIN='<domain>'

#
dig _dmarc."$DOMAIN" txt +noall +answer +short

#
dig +nocmd "$DOMAIN" txt +multiline +noall +answer | awk -F '"' '/spf/{print $2}'

#
dig default._domainkey."$DOMAIN" txt +nocmd +short | awk -F '"|;|=|\\\\' '{print $9$11}'
```
