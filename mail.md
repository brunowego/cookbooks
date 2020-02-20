# mail

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
