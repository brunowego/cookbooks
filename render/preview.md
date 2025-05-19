# Render Preview

## Tip

### TBD

```sh
#
export RENDER_API_KEY='<render-api-key>'
export RENDER_SERVICE_NAME='<service-name>'

#
curl -s \
  -H "Authorization: Bearer $RENDER_API_KEY" \
  https://api.render.com/v1/services | \
    jq -r ".[] | select(.service.name == \"$RENDER_SERVICE_NAME\") | {name: .service.name, id: .service.id}"

#
export PR_NUMBER=91
export RENDER_SERVICE_SLUG="staging-api-pr-$PR_NUMBER"

#
RENDER_SERVICE_ID=$(curl -s \
  -H "Authorization: Bearer $RENDER_API_KEY" \
  https://api.render.com/v1/services | \
  jq -r --arg slug "$RENDER_SERVICE_SLUG" '.[] | select(.service.slug == $slug) | .service.id')

#
export DATABASE_URL='<database-url>'

#
curl \
  -H "Authorization: Bearer $RENDER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '[
    {
      "key": "DATABASE_URL",
      "value": "'"$DATABASE_URL"'"
    }
  ]' \
  -X POST "https://api.render.com/v1/services/$RENDER_SERVICE_ID/env-vars"
```
