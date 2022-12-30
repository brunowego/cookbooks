# Secrets

## Related

- [Hash Tools Analyze](/hash.md#analyze)

## Tools

- [Encryption Key Generator](https://allkeysgenerator.com/Random/Security-Encryption-Key-Generator.aspx) - Security Level: `256-bit`
- [Generate Secret](https://generate-secret.vercel.app/32)
- [dotENV](/dotenv/README.md)
- [redactr](/redactr.md)

## Glossary

- Advanced Encryption Standard (AES)

## Terms

- Obfuscate Secrets
- Redact Secrets

## Tips

### Generate

```sh
#
export LC_CTYPE=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1

#
head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1

#
date +%s | sha256sum | base64 | head -c 32; echo
```
