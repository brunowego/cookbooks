# GitHub Deployments (Environment)

## Query

```sh
#
curl -su "$GITHUB_USER:$GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments" | jq '.[] | .id, .environment'

#
curl -su "$GITHUB_USER:$GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments" | jq -r '.[] | select(.environment | contains("Production")) | .id, .environment'

#
curl -su "$GITHUB_USER:$GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments" | jq -r '.[] | select(.environment == "Production") | .id, .environment'
```

## Tips

### Delete

#### Using gh CLI

```sh
#
export GITHUB_OWNER='<github-owner>'
export GITHUB_REPO='<github-repo>'
export ENVIRONMENT='<environment>' # Preview, Production, etc.

#
gh api "/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments?environment=$ENVIRONMENT" --jq '.[] | "\(.id) - \(.sha[:7]) - \(.created_at)"'

export DEPLOYMENT_ID='<deployment-id>'

gh api \
  --method POST \
  -H 'Accept: application/vnd.github+json' \
  "/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID/statuses" \
  -f state=inactive

gh api \
  --method DELETE \
  -H 'Accept: application/vnd.github+json' \
  "/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID"

#
gh api "/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments?environment=$ENVIRONMENT&per_page=100" --jq '.[].id' | while read ID; do
  echo "Deleting deployment $ID..."
  gh api --method POST "/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$ID/statuses" -f state=inactive > /dev/null
  gh api --method DELETE "/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$ID" > /dev/null
done
```

#### Using API

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
export DEPLOYMENT_ID='1274151952'

#
curl \
  -u "$GITHUB_USER:$GITHUB_TOKEN" \
  -X POST \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/vnd.github.ant-man-preview+json' \
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
  for DEPLOYMENT_ID in `jq -r '.[] | select(.environment == "Production") | .id'`; \
    do curl \
      -u "$GITHUB_USER:$GITHUB_TOKEN" \
      -X POST \
      -H "Content-Type: application/json" \
      -H "Accept: application/vnd.github.ant-man-preview+json" \
      -d '{"state": "inactive"}' \
      "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID/statuses" ; done

#
curl -su "$GITHUB_USER:$GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments" | \
  for DEPLOYMENT_ID in `jq -r '.[] | select(.environment == "Production") | .id'`; \
    do curl \
      -u "$GITHUB_USER:$GITHUB_TOKEN" \
      -X DELETE \
      "https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/deployments/$DEPLOYMENT_ID" ; done
```
