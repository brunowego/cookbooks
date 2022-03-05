# TSConfig

## Links

- [Reference](https://typescriptlang.org/tsconfig)

## Configuration

### Absolute Import

```json
{
  "compilerOptions": {
    "baseUrl": "./",
    "paths": {
      "@/*": [
        "./src/*"
      ]
    }
  }
}
```

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
