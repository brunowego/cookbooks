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

<!--
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,

    /* Bundler mode */
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "types": ["vitest/globals"],

    /* Linting */
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,

    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "references": [{ "path": "./tsconfig.node.json" }],
  "include": [
    "src/**/*.ts",
    "src/**/*.tsx",
    "playwright.config.ts",
    "tailwind.config.ts"
  ],
  "exclude": ["dist", "node_modules"]
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

### Strict Null Checks

```log
'<attr>' is possibly 'undefined'. ts(18048)
```

```json
{
  // ...
  "compilerOptions": {
    "strictNullChecks": false
  }
  // ...
}
```

### TBD

```log
ModuleNotFoundError: Module not found: Error: Can't resolve '@/components/Layout/Button' in '[/path/to/stories]'
```

TODO

### Missing Inputs

```log
No inputs were found in config file '/path/to/tsconfig.json'. Specified 'include' paths were '["..."]' and 'exclude' paths were '["..."]'.ts
```

There is a missing reference to at least one TS file:

```json
{
  // ...
  "include": ["path/to/*.ts"]
}
```
