# AWS Single Sign-On (SSO)

## CLI

### Configuration

```sh
#
aws configure sso

# SSO session name (Recommended): <org-name>
# SSO start URL [None]: https://<org-name>.awsapps.com/start
# SSO region [None]: us-east-1
# SSO registration scopes [sso:account:access]:

# CLI default client Region [None]: us-east-1
# CLI default output format [None]: text
# CLI profile name [AdministratorAccess-<id>]: <org-name>

#
aws sso login --sso-session <name>
```

<!--
aws sso login --profile shopner
-->

<!-- ### Usage

```sh
#
aws sso login --sso-session=<name>
``` -->

### Tips

#### AWS Access Portal URL

##### Customize

<!--
https://youtube.com/watch?v=Sc9QGmOq9w8
-->

1. Enable [IAM Identity Center](https://us-east-1.console.aws.amazon.com/singlesignon/home?region=us-east-1#!/)
2. Dashboard -> Settings summary -> AWS access portal URL -> Customize

##### Configure

1. IAM Identity Center -> Groups -> Greate group -> Group name: Developer -> Create group
2. IAM Identity Center -> Users -> Add user
3. Open AWS Access Portal URL: `https://<org-name>.awsapps.com/start`
4. IAM Identity Center -> Multi-account permissions -> Permission sets -> Create permission set
   - Permission set type: Predefined permission set
   - Policy for predefined permission set: AdministratorAccess
   - Next
5. IAM Identity Center -> Multi-account permissions -> AWS accounts -> Assign users or groups

### Issues

#### TBD

```log
The specified sso-session does not exist: "<name>"
```

TODO

#### Not Have Applications

```log
You do not have any applications.
```

Try "Sign out" and "Sign in" again.

#### TBD

```log
No AWS accounts are available to you.
```

TODO
