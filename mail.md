# mail

## Tools

- [Mailtrap.io](https://mailtrap.io/)
- [MailCatcher](/mailcatcher.md)
- [MailHog](/mailhog.md)

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

### Company Emails

```txt
name+group@example.com
invoices@example.com
security@example.com
sales@example.com
support@example.com
```
