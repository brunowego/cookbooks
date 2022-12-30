# AWS Simple Email Service (SES)

<!--
https://linkedin.com/learning/aws-for-developers-simple-email-service-ses/simple-email-service-ses-for-sending-cheap-and-reliable-email
-->

## Links

- [Main Website](https://aws.amazon.com/ses/)
- [AWS / Console / Email Sending / Sending Statistics](https://console.aws.amazon.com/ses/home?region=us-east-1#dashboard:)

## CLI

### Commands

```sh
aws ses help
```

### Usage

```sh
#
aws \
  --output table \
  ses get-send-quota

#
aws \
  --output table \
  ses list-identities

#
aws ses verify-email-identity \
  --email-address <email>
```

### Tips

#### Send

```sh
#
export AWS_ACCESS_KEY_ID='<access-key>'
export AWS_SECRET_ACCESS_KEY='<secret-key>'

#
aws ses send-email \
  --from <mail> \
  --to <mail> \
  --subject 'Test' \
  --text 'Hello, this is test email from AWS SES service.' \
  --region us-east-1
```
