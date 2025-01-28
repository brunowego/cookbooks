# Cloudflare D1

TODO

<!--
https://github.com/Atyantik/flarekit
-->

<!--
https://dev.to/nks102000/harnessing-cloudflare-d1-and-drizzle-orm-for-scalable-serverless-apps-in-nextjs-1f07
https://zenn.dev/daichi2mori/articles/20240515-cf-d1-hono-drizzle
https://qiita.com/koji0705/items/a5d20fb0d111d123b360
-->

<!--
https://github.com/jotyy/stratokit
https://github.com/praha-inc/feedbackun/tree/main/packages/database

https://github.com/swarajbachu/memoize/blob/main/apps/application/wrangler.toml
https://github.com/krolebord/classroom/blob/master/packages/db/wrangler.toml
https://github.com/korcekj/cookstack/blob/main/packages/server/wrangler.toml

https://github.com/swarajbachu/memoize/blob/main/packages/db/drizzle.config.ts

https://github.com/swarajbachu/memoize
https://github.com/penx-labs/penx
-->

```sh
#
wrangler types --env-interface CloudflareEnv ./env.d.ts
# Or
(cd ./packages/db; npx wrangler types --env-interface CloudflareEnv ./env.d.ts)
```

<!--
wrangler d1 execute <db-name> --file=./drizzle/migrations/<migration-file>.sql --remote
wrangler d1 execute <db-name> --command="SELECT name FROM sqlite_master WHERE type='table';" --remote
-->
