# SMTP Tester

## App

### Installation

#### MAS

```sh
mas install 1633950905
```

## Tips

### Sender Identity

```log
After sending ., response did not start with any of: [2, 3].
Response from server: < 550 The from address does not match a verified Sender Identity. Mail cannot be sent until this error is resolved. Visit https://sendgrid.com/docs/for-developers/sending-email/sender-identity/ to see the Sender Identity requirements
```

Verify if the sender is allowed to send.
