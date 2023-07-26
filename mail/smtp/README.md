# Simple Mail Transfer Protocol (SMTP)

<!--
https://github.com/hideckies/exploit-notes/blob/main/src/exploit/SMTP-Pentesting.md
-->

## References

- [SMTP transport example](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol#SMTP_transport_example)

## Glossary

- Top-Level Domain (TLD)

## Tools

### Managed

- [Amazon Simple Email Service (SES)](/aws/services/ses.md)
- [Mailchimp / Mandrill](https://mandrillapp.com)
- [MailerLite](https://mailerlite.com)
- [MailerSend](/mailersend.md) 🌟
- [Mailgun](https://mailgun.com) 🌟
- [Mailjet](https://mailjet.com)
- [Mailtrap.io](https://mailtrap.io)
- [Postmark](https://postmarkapp.com)
- [Sendinblue](https://sendinblue.com)
- [SparkPost](https://sparkpost.com)
- [Twilio SendGrid](/twilio/sendgrid.md) 🌟

<!--
https://resend.com
-->

### Self-hosted

- [MailCatcher](/mailcatcher.md)
- [MailHog](/mailhog.md) 🌟

<!--
https://github.com/docker-mailserver/docker-mailserver
https://github.com/Mailu/Mailu
https://github.com/jfoucher/Mailocal
https://github.com/samirdjelal/mail-dev
-->

### Testing

- [Ethereal Email](/ethereal.md)

## Connections

| Port | Security    |
| ---- | ----------- |
| 25   | Unencrypted |
| 465  | SSL         |
| 587  | TLS         |

<!--
starttls - ports 587 or 25
force_tls - port 465
-->
