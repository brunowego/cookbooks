# Simple Mail Transfer Protocol (SMTP)

## References

- [SMTP transport example](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol#SMTP_transport_example)

## Test

### Send Email

```sh
#
telnet 127.0.0.1 25

#
telnet 127.0.0.1 587
```

```txt
EHLO relay.example.com
MAIL FROM: <fromuser@example.com>
RCPT TO: <touser@example.com>
DATA
Subject: Sending an email using telnet

Hello,
This is an email sent by using the telnet command.

Your friend,
Me!
.
QUIT
```
