# GitHub Deployments (Environment)

## Tips

### Delete Environment

```sh
#
export USER='<github-user>'
export TOKEN='<github-token>'
export OWNER='<github-owner>'
export REPO='<github-repo>'
```

#### Individual

```sh
#
curl -su "$USER:$TOKEN" "https://api.github.com/repos/$OWNER/$REPO/deployments" | jq .

#
export DEPLOYMENT_ID=1072201471

#
curl \
  -u "$USER:$TOKEN" \
  -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.github.ant-man-preview+json" \
  -d '{"state": "inactive"}' \
  "https://api.github.com/repos/$OWNER/$REPO/deployments/$DEPLOYMENT_ID/statuses"

#
curl \
  -u "$USER:$TOKEN" \
  -X DELETE \
  "https://api.github.com/repos/$OWNER/$REPO/deployments/$DEPLOYMENT_ID"
```

#### Multiple

```sh
#
curl -su "$USER:$TOKEN" "https://api.github.com/repos/$OWNER/$REPO/deployments" | \
  for DEPLOYMENT_ID in `jq '.[].id'`; \
    do curl \
      -u "$USER:$TOKEN" \
      -X POST \
      -H "Content-Type: application/json" \
      -H "Accept: application/vnd.github.ant-man-preview+json" \
      -d '{"state": "inactive"}' \
      "https://api.github.com/repos/$OWNER/$REPO/deployments/$DEPLOYMENT_ID/statuses" ; done

#
curl -su "$USER:$TOKEN" "https://api.github.com/repos/$OWNER/$REPO/deployments" | \
  for DEPLOYMENT_ID in `jq '.[].id'`; \
    do curl \
      -u "$USER:$TOKEN" \
      -X DELETE \
      "https://api.github.com/repos/$OWNER/$REPO/deployments/$DEPLOYMENT_ID" ; done
```
