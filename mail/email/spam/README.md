# Email Spam

## Deliverability Test

- [EXPERTE.com - E-Mail Spam Check](https://experte.com/spam-checker)
- [Google - Postmaster Tools Spam Rate](https://postmaster.google.com)
- [MailReach - Email Spam Test](https://mailreach.co/email-spam-test)
- [Unspam.email - Email Tester, Spam Checker Reputation and Deliverability](https://unspam.email)

## Glossary

- Domain-based Message Authentication, Reporting, and Conformance (DMARC)
- DomainKeys Identified Mail (DKIM)
- Sender Policy Framework (SPF)

## Checklist

- [DKIM](./dkim.md)
- [DMARC](./dmarc.md)
- [SPF](./spf.md)

<!--
BIMI
MTA
-->

## Tips

#### Detect Email Provider

```sh
#
nslookup -type=mx <domain>

#
dig mx <domain>
```
