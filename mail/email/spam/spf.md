# Sender Policy Framework (SPF)

## Tools

- [MxToolbox - SPF Record Check - Lookup SPF Records](https://mxtoolbox.com/spf.aspx)

<!--
https://dmarcian.com/spf-survey
-->

## Checking

```sh
#
export DOMAIN='<domain>'

#
dig +nocmd "$DOMAIN" txt +multiline +noall +answer | awk -F '"' '/spf/{print $2}'
```

## SPF Record

```txt
# Google Workspace (Gmail)
v=spf1 include:_spf.google.com ~all

# Microsoft 365
v=spf1 include:spf.protection.outlook.com ~all

# Zoho
v=spf1 include:zoho.com ~all

# AWS SES
v=spf1 include:amazonses.com ~all
```

## Issues

### Auth0

```txt
v=spf1 include:auth0.com include:<your-email-provider> ~all
```
