# TSConfig

## Configuration

**Refer:** `./tsconfig.base.json`

```json
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true
  }
}
```

**Refer:** `./tsconfig.json`

```json
{
  "extends": "./tsconfig.base",
  "compilerOptions": {
    "baseUrl": "./",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["./next-env.d.ts", "./src/**/*.ts", "./src/**/*.tsx"],
  "exclude": ["./node_modules"]
}
```