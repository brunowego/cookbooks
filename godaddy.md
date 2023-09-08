# GoDaddy

<!--
https://sso.godaddy.com/access?hbi_code=1
-->

## Links

- [Org. Repository](https://github.com/godaddy)
- [Contact Us](https://godaddy.com/help/contact-us)
- [Status Page](https://status.godaddy.com)
- Account
  - [Products](https://account.godaddy.com/products)
  - [Domain Portfolio](https://dcc.godaddy.com/control/portfolio)

## DNS

### Dependencies

- [Lexicon](/lexicon/README.md)

### Store API Key

1. GoDaddy -> Developer Portal
2. API Keys tab -> [API Key Management](https://developer.godaddy.com/keys) -> Create New API Key
3. Create a new API Key
   - Name (Optional): `lexicon-cli`
   - Environment: Production
   - Next

```sh
#
pass insert godaddy.com/api/key
pass insert godaddy.com/api/secret

#
export GODADDY_KEY="$(pass show godaddy.com/api/key)"
export GODADDY_SECRET="$(pass show godaddy.com/api/secret)"

#
alias godaddy="lexicon godaddy --auth-key $GODADDY_KEY --auth-secret $GODADDY_SECRET"
```

### Commands

```sh
godaddy -h
```

### Usage

```sh
#
export DOMAIN='<domain>'

#
godaddy list "$DOMAIN" TXT
godaddy list "$DOMAIN" CNAME
```
