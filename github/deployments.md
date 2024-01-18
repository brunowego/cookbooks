# GitHub Deployments (Environment)

## Tips

### Delete

```sh
#
export GITHUB_USER='<github-user>'
export GITHUB_TOKEN='<github-token>'
export GITHUB_OWNER='<github-owner>'
export GITHUB_REPO='<github-repo>'
```

#### Individual

```sh
#
curl -su "$GITHUB_USER:$GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments" | jq '.[] | .id, .environment'

#
export DEPLOYMENT_ID=1274151952

#
curl \
  -u "$GITHUB_USER:$GITHUB_TOKEN" \
  -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.github.ant-man-preview+json" \
  -d '{"state": "inactive"}' \
  "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID/statuses"

#
curl \
  -u "$GITHUB_USER:$GITHUB_TOKEN" \
  -X DELETE \
  "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID"
```

#### Multiple

```sh
#
curl -su "$GITHUB_USER:$GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments" | \
  for DEPLOYMENT_ID in `jq '.[].id'`; \
    do curl \
      -u "$GITHUB_USER:$GITHUB_TOKEN" \
      -X POST \
      -H "Content-Type: application/json" \
      -H "Accept: application/vnd.github.ant-man-preview+json" \
      -d '{"state": "inactive"}' \
      "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID/statuses" ; done

#
curl -su "$GITHUB_USER:$GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments" | \
  for DEPLOYMENT_ID in `jq '.[].id'`; \
    do curl \
      -u "$GITHUB_USER:$GITHUB_TOKEN" \
      -X DELETE \
      "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID" ; done
```
