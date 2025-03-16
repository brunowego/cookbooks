# Email Spam

## Deliverability Test

- [EXPERTE.com - E-Mail Spam Check](https://experte.com/spam-checker)
- [Google - Postmaster Tools Spam Rate](https://postmaster.google.com)
- [MailReach - Email Spam Test](https://mailreach.co/email-spam-test) 🌟
- [Unspam.email - Email Tester, Spam Checker Reputation and Deliverability](https://unspam.email)

<!--
https://maileroo.com/mail-tester
https://mxtoolbox.com/deliverability
https://mail-tester.com
https://lemwarm.com/deliverability-test
https://easydmarc.com/tools/domain-scanner
https://smartlead.ai/email-deliverability-test

https://boxward.com/email-deliverability-test
-->

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
