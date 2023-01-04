# Sender Policy Framework (SPF)

## Checking

```sh
#
export DOMAIN='<domain>'

#
dig +nocmd "$DOMAIN" txt +multiline +noall +answer | awk -F '"' '/spf/{print $2}'
```
