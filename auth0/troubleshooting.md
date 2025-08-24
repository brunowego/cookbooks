# Troubleshooting

## Send Test Email

<!--
Test email sent to your tenant primary email address (present in Tenant Settings). If you don't receive an email within the next hour, please check your dashboard logs for "Failed Sending Notification" events and review your configuration according to Custom Email Providers. If the problem persists, please contact support.
-->

1. Select Tenant
2. Branding
3. Email Provider
   1. Email Provider -> Choose a provider
   2. Amazon SES (ex.)
   3. Amazon SES Settings -> Send Test Email

<!--
https://manage.auth0.com/dashboard/us/<tenant-name>/logs
https://manage.auth0.com/dashboard/us/<tenant-name>/templates/provider
https://manage.auth0.com/dashboard/us/<tenant-name>/tenant/general
-->

## Issues

### TBD

```log
Error sending email: Email address is not verified. The following identities failed the check in region US-EAST-1: Acme Inc. <noreply@acme.com>
```

TODO
