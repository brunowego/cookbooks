# TSConfig

## Configuration

```sh
# Using Yarn
yarn workspace <scope>/landing add @<scope>/tsconfig --dev

yarn dlx ts-node \
  --showConfig \
  --cwd ./apps/landing
```

**Refer:** `./tsconfig.json`

```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "files": [],
  "references": [{ "path": "./apps/landing" }]
}
```

```sh
#
( cd ./apps/landing && npx tsc --pretty --noEmit )

#
echo '/tsconfig.tsbuildinfo' >> ./apps/landing/.gitignore
```

<!--
npm install <package> -w <workspace>

pnpm add <package> --filter <workspace>
-->
