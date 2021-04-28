# Simple Mail Transfer Protocol (SMTP)

## References

- [SMTP transport example](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol#SMTP_transport_example)

## Test

### Send Email

```sh
#
nmap -p 25,587 127.0.0.1

#
telnet 127.0.0.1 25

#
telnet 127.0.0.1 587
```

```txt
EHLO 127.0.0.1
MAIL FROM: <noreply@127.0.0.1>
RCPT TO: <user@127.0.0.1>
DATA
Subject: Sending an email using telnet

Hello,
This is an email sent by using the telnet command.

Your friend,
Me!
.
QUIT
```
