# Simple Mail Transfer Protocol (SMTP)

<!--
https://github.com/hideckies/exploit-notes/blob/main/src/exploit/SMTP-Pentesting.md
-->

## References

- [SMTP transport example](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol#SMTP_transport_example)

## Glossary

- Top-Level Domain (TLD)

## Connections

| Port | Security    |
| ---- | ----------- |
| 25   | Unencrypted |
| 465  | SSL         |
| 587  | TLS         |

## Assessment

```sh
#
export TLD='sendgrid.net'
```

### Test

```sh
#
nslookup -type=mx "$TLD"
# or
dig "$TLD" mx

#
nc smtp."$TLD" 25
nc smtp."$TLD" 465
nc smtp."$TLD" 587

#
openssl s_client -connect smtp."$TLD":465
openssl s_client -connect smtp."$TLD":587 -starttls smtp
```

### Send Email

```sh
#
nmap -p 25,465,587 "$TLD"

#
telnet "$TLD" 25
telnet "$TLD" 465
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
