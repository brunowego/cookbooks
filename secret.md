# Secret

## Tools

- [Generate Secret](https://generate-secret.vercel.app/32)
- [Encryption Key Generator](https://allkeysgenerator.com/Random/Security-Encryption-Key-Generator.aspx)

## Tips

### Generate

```sh
#
export LC_CTYPE=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
```
