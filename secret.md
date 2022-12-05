# Secret

## Related

- [Hash Tools Analyze](/hash.md#analyze)

## Tools

- [Encryption Key Generator](https://allkeysgenerator.com/Random/Security-Encryption-Key-Generator.aspx) - Security Level: `256-bit`
- [Generate Secret](https://generate-secret.vercel.app/32)

## Glossary

- Advanced Encryption Standard (AES)

## Terms

- Obfuscate Secrets
- Redact Secrets

## Tools

- [dotENV](/dotenv/README.md)
- [redactr](/redactr.md)

## Tips

### Generate

```sh
#
export LC_CTYPE=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1

#
head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1
```
