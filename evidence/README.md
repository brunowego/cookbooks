# Evidence

**Keywords:** Serverless BI, Business Intelligence as Code

## Links

- [Code Repository](https://github.com/evidence-dev/evidence)
- [Main Website](https://evidence.dev)
- [Examples](https://evidence.dev/examples)
- [Docs](https://docs.evidence.dev)
  - [Deployment / Vercel](https://docs.evidence.dev/deployment/vercel)

<!--
https://github.com/evidence-dev/demo
-->

## Library

### Tips

#### Visual Studio Code

```sh
#
code --install-extension evidence.evidence-vscode

#
jq '."recommendations" += ["evidence.evidence-vscode"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### TBD

```log
npm ERR! path /vercel/path0/node_modules/lz4
```

<!--
https://github.com/evidence-dev/evidence/issues/1885
https://github.com/evidence-dev/evidence/pull/1886
-->

TODO

#### TBD

```log
(!) Could not auto-determine entry point from rollupOptions or html files and there are no explicit optimizeDeps.include patterns. Skipping dependency pre-bundling.
```

TODO

#### TBD

```log
Error: Catalog Error: Table with name waitlist does not exist!
Did you mean "temp.information_schema.tables"?
```

<!--
https://github.com/evidence-dev/sqltools-duckdb-driver/issues/11
-->

TODO

#### Missing Manifest

```log
Without a manifest file, no data is available.
```

Missing run `evidence sources`.

#### Problem with Bun

```log
'<table-name>' is not defined
```

Try run with `npm` instead of `bun`.

## CLI

### Commands

```sh
evidence -h

#
npx evidence -h
```

### Usage

```sh
#
evidence env-debug --include-values

#
evidence sources --debug
```

<!--
https://github.com/evidence-dev/evidence/blob/main/packages/postgres/index.cjs
https://github.com/evidence-dev/evidence/blob/main/packages/plugin-connector/src/data-sources/index.js

EVIDENCE_SOURCE__postgres__host=
EVIDENCE_SOURCE__postgres__port=5432
EVIDENCE_SOURCE__postgres__database=
EVIDENCE_SOURCE__postgres__user=
EVIDENCE_SOURCE__postgres__password=
EVIDENCE_SOURCE__postgres__ssl__sslmode=require
-->
