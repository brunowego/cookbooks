# Mail

<!--
Himalayas

Panelbear
Netflix
Nomad
Scribd
OLX
Statuspage
Udemy
Lee Robinson
Avocode Team
Spark
WeTransfer
Rebel
Republic
Workplace
Auth0
GoDaddy
Uphold
-->

## Tools

- [Mailtrap.io](https://mailtrap.io/)
- [MailCatcher](/mailcatcher.md)
- [MailHog](/mailhog.md)

## Glossary

- Calendaring Extensions to WebDAV (CalDAV)
- For Your Information (FYI)
- Web-based Distributed Authoring and Versioning (WebDAV)

## CLI

### Commands

```sh
mail
```

### Test

```sh
echo 'Hello, this is an email sent by using the mail command. Your friend, Me!' | mail -s 'Sending an email using mail' touser@example.com
```

```sh
cat << EOMAIL | mail -s 'Sending an email using mail' touser@example.com
Hello, This is an email sent by using the mail command.

Your friend,
Me!

EOMAIL
```

## Tips

### Double Hyphens

```txt
Body

--

Signature
```