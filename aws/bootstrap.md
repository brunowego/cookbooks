# Bootstrap

## New Account

1. [AWS Free Tier](https://aws.amazon.com/free)
2. Sign up for AWS
   - Root user email address: `admin@xyz.tld`
   - AWS account name: ACME

## IAM

<!--
IAM Users:
- Admin (AdministratorAccess)
- Manager (Billing)
- ML Engineer (Lambda, SageMaker, EC2, S3)
-->

- [Users](https://us-east-1.console.aws.amazon.com/iamv2/home#/users)
- Add users
- User details
  - User name: `<username>@xyz.tld`
  - Check: Provide user access to the AWS Management Console - optional
  - Check: I want to create an IAM user
  - Next
- Permissions options
  - Check: Attach policies directly
  - Check AdministratorAccess
  - Next
- Tags
  - JobTitle: Admin
  - PersonalEmail: `<username>@xyz.tld` (Or WorkEmail)
  - Create user

<!--
Setup MFA
-->

## Alarm

<!--
Root Account
-->

- [AWS Billing Dashboard](https://us-east-1.console.aws.amazon.com/billing/home#/)
- [Preferences](https://us-east-1.console.aws.amazon.com/billing/home?#/preferences)
  - Invoice delivery preferences: Check "PDF invoices delivered by email"
  - Alert preferences:
    - Check "Receive AWS Free Tier alerts"
- [CloudWatch / Billing alarms](https://us-east-1.console.aws.amazon.com/cloudwatch/home#alarmsV2:?~(namespace~'AWS*2fBilling))
  - Conditions: Static / Greater/Equal / 10 USD
  - Next
  - Notification: Create new topic
    - Create a new topic…: Billing
    - Email endpoints that will receive the notification…: `<username>@xyz.tld`
    - Create topic
    - Next
  - Alarm name: Billing
  - Next
  - Create alarm
  - Open Email and confirm subscription

## Next Steps

- [Service Quotas (Limits)](./services/service-quotas.md)
