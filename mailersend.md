# MailerSend

## Links

- [Org. Repository](https://github.com/mailersend/)
- [Main Website](https://mailersend.com)

## Docs

## Glossary

- Sender Policy Framework (SPF)

## Provisioning

### GoDaddy

#### Dependencies

- [GoDaddy / DNS](/godaddy.md#dns)

#### Configuration

```sh
#
export DOMAIN='<domain>'

#
godaddy create "$DOMAIN" TXT --name '@' --content 'v=spf1 include:_spf.mailersend.net ~all'

godaddy create "$DOMAIN" TXT --name '<name>' --content '<content>'

godaddy list "$DOMAIN" TXT

#
godaddy create "$DOMAIN" CNAME --name 'mta' --content 'mailersend.net'

godaddy list "$DOMAIN" CNAME
```

#### Tips

##### Merge SPF Records

**Docs:** [How to merge multiple SPF records](https://mailersend.com/help/how-to-merge-spf-records)

```sh
#
godaddy list "$DOMAIN" TXT | grep 'v=spf1'

# Yandex
export CURRENT='v=spf1 redirect=_spf.yandex.net' godaddy delete "$DOMAIN" TXT --name '@' --content "$CURRENT"

#
godaddy create "$DOMAIN" TXT --name '@' --content "$CURRENT include:_spf.mailersend.net ~all"
```
