# AWS Secrets Manager

<!--
https://github.com/sotoiwa/eks-gitops-sample
-->

## Links

- [Secrets](https://console.aws.amazon.com/secretsmanager/home?region=us-east-1#!/listSecrets)

## CLI

### Commands

```sh
aws secretsmanager help
```

### Usage

```sh
#
aws \
  --output json \
  secretsmanager list-secrets | \
  jq .

#
aws \
  --region 'us-east-1' \
  secretsmanager create-secret \
    --name dockerhub \
    --description 'A good description here' \
    --secret-string '{"username":"[username]","password":"[password]"}'

#
aws \
  --output json \
  secretsmanager get-secret-value \
    --secret-id '[secret-id]' | \
      jq -r .SecretString
```

<!-- ### Tips

#####

```sh
dockerconfigjson=$(kubectl create secret docker-registry mysecret \
  --docker-server https://index.docker.io/v1/ \
  --docker-username [username] \
  --docker-password [password] \
  --dry-run='client' \
  -o json \
    | jq -r '.data.".dockerconfigjson"' | \
      base64 --decode)

aws secretsmanager create-secret \
  --region ap-northeast-1 \
  --name dockerconfigjson \
  --description '' \
  --secret-string $dockerconfigjson
``` -->
