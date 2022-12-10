# Simple Mail Transfer Protocol (SMTP)

## References

- [SMTP transport example](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol#SMTP_transport_example)

## Glossary

- Top-Level Domain (TLD)

## Assessment

```sh
#
export TLD='yandex.com'
```

### Test

```sh
#
nslookup -type=mx "$TLD"

#
dig "$TLD" mx

#
nc smtp."$TLD" 25
nc smtp."$TLD" 587

#
openssl s_client -connect smtp."$TLD":25 -starttls smtp
openssl s_client -connect smtp."$TLD":587 -starttls smtp
```

### Send Email

```sh
#
nmap -p 25,587 "$TLD"

#
telnet "$TLD" 25
telnet "$TLD" 587
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
