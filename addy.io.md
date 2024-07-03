# Addy.io

## Links

- [Main Website](https://addy.io)

## Configuration

### DNS records

| Type  | Host             | Value/Points to                       |
| ----- | ---------------- | ------------------------------------- |
| MX 10 | `@`              | `mail.anonaddy.me.`                   |
| MX 20 | `@`              | `mail2.anonaddy.me.`                  |
| TXT   | `@`              | `v=spf1 include:spf.anonaddy.me -all` |
| CNAME | `dk1._domainkey` | `dk1._domainkey.anonaddy.me.`         |
| CNAME | `dk2._domainkey` | `dk2._domainkey.anonaddy.me.`         |
| TXT   | `_dmarc`         | `v=DMARC1; p=quarantine; adkim=s`     |

#### GoDaddy

**Depedencies:** [GoDaddy](/godaddy.md)

```sh
#
export DOMAIN='<domain>'

#
godaddy list "$DOMAIN" MX
godaddy list "$DOMAIN" TXT
godaddy list "$DOMAIN" CNAME

#
godaddy create "$DOMAIN" TXT --name '@' --content 'aa-verify=<id>'

godaddy create "$DOMAIN" MX --name '@' --content 'mail.anonaddy.me.' --priority 10
godaddy create "$DOMAIN" MX --name '@' --content 'mail2.anonaddy.me.' --priority 20

godaddy create "$DOMAIN" TXT --name '@' --content 'v=spf1 include:spf.anonaddy.me -all'
godaddy create "$DOMAIN" TXT --name '_dmarc' --content 'v=DMARC1; p=quarantine; adkim=s'

godaddy create "$DOMAIN" CNAME --name 'dk1._domainkey' --content 'dk1._domainkey.anonaddy.me.'
godaddy create "$DOMAIN" CNAME --name 'dk2._domainkey' --content 'dk2._domainkey.anonaddy.me.'
```
