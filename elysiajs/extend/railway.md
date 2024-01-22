# Extend with Railway

<!-- ```json
{
  "$schema": "https://railway.app/railway.schema.json",
  "build": {
    "builder": "NIXPACKS",
    "buildCommand": "bun build"
  },
  "deploy": {
    "startCommand": "bun start",
    "restartPolicyType": "ON_FAILURE"
  }
}
``` -->

TODO

<!-- **Refer:** `./nixpacks.toml` -->

<!-- ```
[phases.setup]
nixPkgs = ['nodejs', 'bun']
nixpkgsArchive = '2d67382acbdc2aea9bc2743fc3c40815375a0078'

[phases.install]
dependsOn = ["setup"]
# cmds = ['bun install --production']
cmds = ['bun install']

[phases.build]
cmds = ['bun run build']

[start]
cmd = 'bun run start'
``` -->
