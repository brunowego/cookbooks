# Extend with GitHub Actions

<!--
https://github.com/misea/find-masto-folks/blob/main/.github/workflows/redeploy.yml
-->

TODO

<!--
https://vercel.com/docs/rest-api/endpoints/deployments#create-a-new-deployment
-->

<!--
curl
  -X POST "https://api.vercel.com/v9/deployments?teamId=${VERCEL_TEAM_ID}&forceNew=1&withCache=1" \
  -H "Authorization: Bearer ${VERCEL_AUTH_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"${VERCEL_PROJECT_NAME}\",\"gitSource\":{\"ref\":\"${BRANCH_NAME}\",\"repo\":\"${GIT_REPO}\",\"org\":\"${VERCEL_ORG}\",\"type\":\"github\"}}" \
    | jq .alias | jq first -r
-->
