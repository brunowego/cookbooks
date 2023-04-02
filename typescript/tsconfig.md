# TSConfig

## Links

- [Reference](https://typescriptlang.org/tsconfig)

## Configuration

<!--
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "display": "Next.js",
  "extends": "./base.json",
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "incremental": true,
    "esModuleInterop": true,
    "module": "esnext",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve"
  },
  "include": ["src", "next-env.d.ts"],
  "exclude": ["node_modules"]
}
-->

### Absolute Import

**Refer:** `./tsconfig.json`

```json
{
  "compilerOptions": {
    // ...
    "baseUrl": "./",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

```sh
ts-node --showConfig
```

<!-- ###

```sh
pnpm add ts-node tsconfig-paths -D
```

```json
{
  "ts-node": {
    "require": ["tsconfig-paths/register"]
  },
  "compilerOptions": {
    "baseUrl": "./",
    "paths": {
      "@/db/*": ["./db/*"],
      "@/src/*": ["./src/*"]
    }
  },
  "include": ["./db/**/*.ts", "./src/**/*.ts"],
  "exclude": ["./node_modules"]
}
``` -->

## Issues

### TBD

```log
ModuleNotFoundError: Module not found: Error: Can't resolve '@/components/Layout/Button' in '[/path/to/stories]'
```

TODO

### TBD

```log
No inputs were found in config file '/apps/web/tsconfig.json'. Specified 'include' paths were '["../../packages/acme-tsconfig/./next-env.d.ts","../../packages/acme-tsconfig/./**/*.ts","../../packages/acme-tsconfig/./**/*.tsx"]' and 'exclude' paths were '["../../packages/acme-tsconfig/./.yarn"]'.ts
```

TODO
