# Yandex Admin

**Keywords:** Russian, Mail

## Links

- [Main Website](https://admin.yandex.ru)

## Guides

- [Configure IMAP-based client](https://yandex.com/support/mail/mail-clients.html#imap)
- [Spark - Can’t Connect to a Yandex Account](https://support.readdle.com/spark/troubleshooting/cant-connect-to-a-yandex-account)

## Docs

### Confirm Domain

1. Open [Yandex Connect](https://connect.yandex.com) -> Try out
2. Login with your account or register
3. Dashboard -> New organization
   - Enter domain name
   - Activate
4. [Webmaster](https://connect.yandex.com/portal/services/webmaster) -> Domains Tab -> Confirm your domain

### Add Email

1. Open [Yandex Connect - Admin](https://connect.yandex.com/portal/admin)
2. Add -> Add a person
3. New employee

### Configure IMAP-based client

| Mail     | Server            | Protection | Port |
| -------- | ----------------- | ---------- | ---- |
| Incoming | `imap.yandex.com` | SSL/TLS    | 993  |
| Outgoing | `smtp.yandex.com` | SSL/TLS    | 465  |

<!--
https://dmarc.io/source/yandex/
https://yandex.com/support/business/dns/dkim.html?lang=en
-->
