# AWS Amplify

<!--
https://app.pluralsight.com/library/courses/full-stack-serverless-apps-aws-amplify-getting-started/table-of-contents
-->

## Links

- [Code Repository](https://github.com/aws-amplify/amplify-js)
- [Main Website](https://aws.amazon.com/amplify/)

## CLI

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
