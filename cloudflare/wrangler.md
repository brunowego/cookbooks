# Wrangler

<!--
https://github.com/unkeyed/unkey/blob/main/apps/api/wrangler.toml
-->

## Links

- [Main Website](https://developers.cloudflare.com/workers/wrangler)
- [Pricing](https://developers.cloudflare.com/workers/platform/pricing)

<!--
https://cloudflare.com/plans/developer-platform
https://developers.cloudflare.com/browser-rendering/platform/wrangler
-->

## Library

### Installation

```sh
# Using pnpm
pnpm add wrangler -D

# Using Bun
bun add wrangler -D
```

### Configuration

```sh
#
npx wrangler login

#
npx wrangler whoami
```

### Initialization

<!-- ```sh
npx wrangler init <project-name>
``` -->

**Refer:** `./wrangler.toml`

```toml
name = '<name>'
account_id = '<cloudflare-account-id>'
workers_dev = true
```

### Issues

#### TBD

```sh
✘ [ERROR] Missing entry-point: The entry-point should be specified via the command line (e.g. `wrangler dev path/to/script`) or the `main` config field.
```

TODO

## CLI

### Installation

```sh
# Using npm
npm install wrangler -g
```

### Configuration

```sh
#
wrangler login

#
wrangler whoami
```

<!--
wrangler pages dev dist --env development --port 8786
wrangler pages deploy dist

wrangler d1 migrations apply sonicjs --local
wrangler d1 migrations apply sonicjs
wrangler pages deployment tail
-->
