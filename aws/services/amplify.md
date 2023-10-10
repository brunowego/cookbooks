# AWS Amplify

**Keywords:** Serverless Framework

## TL;DR

Amplify is a framework for creating serverless applications on AWS.

## Links

- Code Repository
  - [Library](https://github.com/aws-amplify/amplify-js)
  - [CLI](https://github.com/aws-amplify/amplify-cli)
- [Main Website](https://aws.amazon.com/amplify/)
- [Docs](https://docs.amplify.aws/)
- [AWS Console / Amplify / All apps](https://console.aws.amazon.com/amplify/home?region=us-east-1#/home)

## Features

- Authentication
- REST and GraphQL APIs
- Storage and DataStore
- Functions and Interactions
- PubSub and Push Notifications
- AI/ML Predictions
- Analytics
- Hosting
- CI/CD
- Pull Requests Previews
- Monitoring
- Custom Domains/SSL Certificate

## CLI

### Installation

#### NPM

```sh
npm install -g @aws-amplify/cli
```

### Commands

```sh
amplify -h
```

### Configure

```sh
#
amplify configure --usage-data-off

#
amplify configure
```

1. Specify the AWS Region: `us-east-1`
2. Specify the username of the new IAM user: `amplify-my-app`
3. Complete the user creation using the AWS console
4. Enter the access key of the newly created user
5. This would update/create the AWS Profile in your local machine: `amplify`

### Usage

```sh
#
amplify init

#
amplify status

#
amplify add [category]
amplify add auth
amplify add api
amplify add hosting
#
amplify push

#
amplify console api

#
amplify update api

#
amplify publish

#
amplify delete
```

### Tips

#### Vue UI

```sh
#
npm add aws-amplify @aws-amplify/ui-vue
```

```vue
<template>
  <amplify-authenticator>
    <!-- App code... -->
    <amplify-sign-out></amplify-sign-out>
  </amplify-authenticator>
</template>
```

## AWS CLI

### Commands

```sh
aws amplify help
```

### Usage

```sh
#
aws amplify create-app --name [name]

#
aws amplify create-domain-association \
  --app-id [app-id] \
  --domain-name [mydomain.com] \
  --sub-domain-setting prefix=www,branchName=master \
  --region us-east-1

#
aws amplify start-deployment \
  --app-id [app-id] \
  --branch-name master \
  --region us-east-1

#
aws amplify list-apps \
  --region us-east-1
```
