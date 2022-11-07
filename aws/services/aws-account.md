# AWS Account

## Glossary

- Identity and Access Management (IAM)
- Multi-Factor Authentication (MFA)

## Details

- Account ID (12 digits)
- Console Address: `https://<account-id>.signin.aws.amazon.com/console`

## Bootstrap

1. [Sign up for AWS](https://portal.aws.amazon.com/billing/signup) -> Complete sign up
2. Sign in using root user email
   - IAM -> Add MFA for root user
   - IAM -> Users -> Add users
     - User name: `<username>@<domain>`
     - Select AWS credential type: `Access key - Programmatic access`
     - Attach existing policies directly: `AdministratorAccess`
   - Use [AWS Profile Manager (a.k.a. AWS Profile Switcher)](/aws-profile-manager.md) to configure locally access through AWS CLI.

## CLI

### Commands

```sh
aws account help
```
