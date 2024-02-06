# Fly

<!--
https://github.com/search?q=path%3Aapps+path%3Afly.toml&type=code
-->

## Links

- [Main Website](https://fly.io)
- [Dashboard](https://fly.io/dashboard)
- [Docs](https://fly.io/docs)
  - [Fly Launch configuration (fly.toml)](https://fly.io/docs/reference/configuration)
  - [Regions](https://fly.io/docs/reference/regions)
  - [Use a custom domain](https://fly.io/docs/networking/custom-domain/)

## CLI

### Installation

#### Homebrew

```sh
brew tap superfly/tap
brew install flyctl
```

### Commands

```sh
fly -h
```

### Initialization

```sh
#
fly auth login

#
fly version update
fly settings autoupdate enable
```

### Configuration

**Refer:** `./fly.toml`

```toml
app = "<unique-app-name>"
primary_region = "gru"

[build]
  dockerfile = "./Dockerfile"

[[vm]]
  cpu_kind = "shared"
  cpus = 1
  memory_mb = 256

[http_service]
  internal_port = 3000
  force_https = true
  auto_stop_machines = true
  auto_start_machines = true
  min_machines_running = 1

[[http_service.checks]]
  grace_period = "10s"
  interval = "15s"
  method = "GET"
  timeout = "5s"
  path = "/ping"
```

### Usage

<!--
fly regions list -c ./fly.toml
-->

```sh
#
fly doctor c ./fly.toml

#
flyctl apps create <unique-app-name>

#
flyctl apps ls

#
fly config env -c ./fly.toml

#
fly deploy -c ./fly.toml --dockerfile ./Dockerfile
# --remote-only --wait-timeout=500

#
flyctl ips list -c ./fly.toml

#
fly apps open <unique-app-name>

#
fly status -c ./fly.toml

#
fly logs -a <unique-app-name>

#
fly ssh console -c ./fly.toml
```

<!--
fly launch --name <unique-app-name>
fly ext sentry create
fly redis create
fly launch --now
npx dockerfile --dev
bunx dockerfile
-->

### Tips

#### Secrets

TODO

<!-- ```sh
fly secrets set <NAME>=<VALUE>
fly secrets set SECRET_KEY=YOURSECRETKEYGOESHERE
fly secrets import < .dotenv
``` -->

#### Certificate

```sh
#
fly certs list -c ./fly.toml

#
fly certs show <domain> -a <unique-app-name>

#
fly certs check <domain> -a <unique-app-name>
```

<!--
fly certs add
fly certs remove
-->
