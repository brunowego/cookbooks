# Deploy on Heroku

## Links

- [Docs](https://docs.medusajs.com/deployments/server/deploying-on-heroku)

## Dependencies

- [Heroku](/heroku/README.md)

## Configuration

```sh
#
export APP_NAME=

#
heroku create "$APP_NAME"

#
heroku git:remote -a "$APP_NAME"

#
heroku addons:create heroku-postgresql:mini
heroku addons:create stackhero-redis:ist-m4euc0

#
heroku config:set NODE_ENV=production
heroku config:set JWT_SECRET=S3cr3t_K@Key
heroku config:set COOKIE_SECRET=S3cr3t_K@Key
heroku config:set NPM_CONFIG_PRODUCTION=false

#
heroku buildpacks:set heroku/nodejs

#
heroku config:set REDIS_URL="$(heroku config:get STACKHERO_REDIS_URL_TLS)"
heroku config:set EVENT_REDIS_URL="$(heroku config:get STACKHERO_REDIS_URL_TLS)"
# heroku config:set ADMIN_CORS=<YOUR_ADMIN_URL>
# heroku config:set STORE_CORS=<YOUR_STOREFRONT_URL>

#
heroku apps:info -a "$APP_NAME"

#
heroku logs -n 500000 --remote heroku --tail -a "$APP_NAME"

Procfile
web: npm run serve

echo "web: cd apps/frontend && yarn start" > Procfile

#
heroku apps:destroy -a "$APP_NAME" -c "$APP_NAME"
```
