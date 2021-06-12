# AWS Identity and Access Management (IAM)

<!--
https://app.pluralsight.com/paths/skills/identity-and-access-management-on-aws

https://app.pluralsight.com/library/courses/aws-assigning-identity-based-policies-users-roles-groups/table-of-contents
-->

## Authentication

- AWS CLI
- AWS SDKs
- AWS Management Console

## IAM Roles

- IAM users, applications, and services may assume IAM roles
- Uses an IAM policy for permissions

## CLI

### Commands

```sh
aws iam help
```

### Usage

```sh
#
aws iam get-user

aws iam get-user \
  --user-name <username>

#
aws iam list-users

#
aws iam create-user \
  --user-name <username>

#
aws iam list-access-keys

aws iam list-access-keys \
  --user-name <username>

#
aws iam create-access-key \
  --user-name <username>

#
aws iam list-groups

#
aws iam create-group --group-name 'Administration'
aws iam create-group --group-name 'DatabaseAdministrator'
aws iam create-group --group-name 'NetworkAdministrator'
aws iam create-group --group-name 'Development'
aws iam create-group --group-name 'Auditors'

#
aws iam list-policies | grep AmazonEC2 | grep Access

#
aws iam attach-group-policy \
  --policy-arn 'arn:aws:iam::aws:policy/AmazonEC2FullAccess' \
  --group-name 'Administration'

#
aws iam add-user-to-group \
  --group-name 'Administration' \
  --user-name <username>

#
aws \
  --output json \
  iam get-account-summary
```

<!--
POLICY_ARN=$(aws iam create-policy \
  --policy-name 'RoleCreatorPolicy-$RANDOM' \
  --policy-document file://RoleCreatorPolicy.json \
  --query 'Policy.Arn' \
  --output text \
)

aws iam attach-group-policy \
  --policy-arn "$POLICY_ARN" \
  --group-name 'Administration'
-->

## Docs

### Programmatic Access User

1. AWS Management Console -> AWS services
2. Security, Identity, & Compliance -> [IAM](https://console.aws.amazon.com/iam/home?region=us-east-2#/home)
3. Users -> Add User
   - Set user details -> User name: <name>
   - Select AWS access type -> Access type: Check "Programmatic access"
   - Next: Permissions
   - Set permissions -> Attach existing policies directly -> Check "AdministratorAccess"
   - Next: Tags
   - Next: Review
   - Create user
