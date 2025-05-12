# Branch

## Tips

### Get Database URL from Branch

```sh
#
export NEON_API_KEY='<neon-api-key>'
export NEON_PROJECT_ID='<neon-project-id>'

#
curl \
  -H "Authorization: Bearer $NEON_API_KEY" \
  -H 'Content-Type: application/json' \
  -X GET "https://console.neon.tech/api/v2/projects/$NEON_PROJECT_ID/branches" | \
    jq -r '.branches[] | select(.name == "main") | .id'

#
export NEON_BRANCH_ID='<branch-id>'
export NEON_PR_NUMBER='<pr-number>'

#
curl \
  -H "Authorization: Bearer $NEON_API_KEY" \
  -H 'Content-Type: application/json' \
  -d "{
    \"branch\": {
      \"name\": \"pr-$NEON_PR_NUMBER\",
      \"parent_id\": \"$NEON_BRANCH_ID\"
    },
    \"endpoints\": [
      {
        \"type\": \"read_write\"
      }
    ]
  }" \
  -X POST "https://console.neon.tech/api/v2/projects/$NEON_PROJECT_ID/branches" | \
    jq .

#
BRANCH_ID=$(curl -s \
  -H "Authorization: Bearer $NEON_API_KEY" \
  -X GET "https://console.neon.tech/api/v2/projects/$NEON_PROJECT_ID/branches" | \
    jq -r '.branches[] | select(.name == "pr-'"$NEON_PR_NUMBER"'") | .id')

#
ENDPOINT_HOST=$(curl -s \
  -H "Authorization: Bearer $NEON_API_KEY" \
  -X GET "https://console.neon.tech/api/v2/projects/$NEON_PROJECT_ID/branches/$BRANCH_ID/endpoints" | \
    jq -r '.endpoints[] | select(.type == "read_write") | .host')
```
