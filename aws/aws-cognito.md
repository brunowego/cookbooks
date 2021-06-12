# AWS Cognito

Amazon Cognito lets you add user sign-up, sign-in, and access control to your web and mobile apps quickly and easily.

<!--
Cognito -> API Gateway -> Backend (Lambda REST API)

acessar cognito, ver usuário, email verificado
acessar api gateway, ver autorização, ver em autorizadores, acessar recursos, autorização, ações implantar api
acessar lambda, ver código lambda

Cognito User Pool

AWS IAM authorizer
Lambda request and token authorizers
Cognito user pools authorizers

https://github.com/aws-samples/aws-amplify-ecommerce

API Gateway

https://docs.aws.amazon.com/cognito/latest/developerguide/external-identity-providers.html
https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html

https://pydio.com/en/docs/kb/identity-management/using-aws-cognito-identity-provider


https://www.youtube.com/watch?v=oKjyRjkNj18
https://www.youtube.com/watch?v=0LlXaj8sHuQ
https://www.youtube.com/watch?v=fs9HfYbWjXQ
https://www.youtube.com/watch?v=9BWezRlOjmA
https://www.youtube.com/watch?v=0dVL70Ayq5I
https://www.youtube.com/watch?v=48maKOJiaSo
https://www.youtube.com/watch?v=IiWyPb389UU
https://www.youtube.com/watch?v=k972AcbeYS8
https://www.youtube.com/watch?v=oFSU6rhFETk
https://www.youtube.com/watch?v=o7OHogUcRmI
-->

## Implementations

- [aws-cognito-react - v2](https://github.com/dbroadhurst/aws-cognito-react)

## Access Control Types

- Role-based Access Control (RBAC)

## Serverless Auth Needs

- Secure user directory.
- Support for workflows including change password and multi-factor authentication.
- Includes groups and the ability to assign a user to one or more groups.
- Ability for users to securely sign-in in a client such as a web or mobile application.
- Mechanism for securing APIs based on the user's account for the application.

## Identity Sources in Cognito

- User Poll Directory: Leverages Cognito for the user directory and identify source.
- Identify Federation: Enables users to sign-in with an existing identity source (enterprise active directory, social).

## CLI

### Commands

```sh
aws cognito-identity help
aws cognito-idp help
aws cognito-sync help
```
