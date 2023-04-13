# AWS Identity and Access Management (IAM)

<!--
https://app.pluralsight.com/paths/skills/identity-and-access-management-on-aws

https://app.pluralsight.com/library/courses/aws-assigning-identity-based-policies-users-roles-groups/table-of-contents

https://gist.github.com/brianantonelli/e3fe950fffdd04275b306953a5742104
https://avmconsulting.net/setup-kubernetes-cluster-with-terraform-and-kops-part-1/
https://www.nclouds.com/blog/kubernetes-aws-terraform-kops/
https://aymen-segni.com/index.php/2020/04/19/deploy-kubernetes-aws-k8s-cluster-with-terraform-and-kops/
https://ryaneschinger.com/blog/kubernetes-aws-vpc-kops-terraform/
https://blog.kasten.io/hands-on-deploying-kubernetes-with-terraform?utm_term=&utm_campaign=Website+traffic-Search%2Bdisplay-86+(Remarketing)&utm_source=adwords&utm_medium=ppc&hsa_acc=3144319558&hsa_cam=13192272412&hsa_grp=121361024814&hsa_ad=523196361073&hsa_src=g&hsa_tgt=dsa-1279855672054&hsa_kw=&hsa_mt=b&hsa_net=adwords&hsa_ver=3&gclid=CjwKCAjw8cCGBhB6EiwAgORey1bilNLsAwOp68hXteFQ9xhvVGUREbMU28imM5WJKqEzyO96pngGDRoCpH8QAvD_BwE
-->

## Console

- [Dashboard](https://console.aws.amazon.com/iamv2/home)

## Guides

- [IAM policy examples for secrets in AWS Secrets Manager](https://docs.aws.amazon.com/mediaconnect/latest/ug/iam-policy-examples-asm-secrets.html)
- [Switching to an IAM role (AWS CLI)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-cli.html)
- [IAM tutorial: Delegate access across AWS accounts using IAM roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html)

## Glossary

- IAM Roles for Service Accounts (IRSA)

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

aws iam list-attached-user-policies --user-name [name]

aws iam create-access-key --user-name [name]
-->

### Tips

#### Switch Role

```sh
cat << EOF >> ~/.aws/config
[profile prodaccess]
role_arn = arn:aws:iam::000000000000:role/ProductionAccessRole
source_profile = default
EOF

#
aws \
  --profile prodaccess \
  iam list-users

#
AWS_PROFILE=prodaccess \
  aws iam list-users
```

### Issues

#### Get Caller Identity

```log
An error occurred (ValidationError) when calling the GetUser operation: Must specify userName when calling with non-User credentials
```

```sh
aws sts get-caller-identity
```

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
