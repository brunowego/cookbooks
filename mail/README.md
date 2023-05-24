# Mail

## Related

- [E-mail](/email/README.md)

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
echo 'Hello, this is an email sent by using the mail command. Your friend, Me!' | mail -s 'Sending an email using mail' touser@xyz.tld
```

```sh
cat << EOMAIL | mail -s 'Sending an email using mail' touser@xyz.tld
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
