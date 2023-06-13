# Vercel

## Configuration

1. Project -> Settings
2. General
   - Build & Development Settings
     - Build Command:
       - Using NPM: `cd ../../ && npx turbo run build --include-dependencies --no-deps --scope=@<package>/landing`
       - Using Yarn: `cd ../../ && yarn turbo run build --include-dependencies --no-deps --scope=@<package>/landing`
       - Using pnpm: `cd ../../ && pnpm turbo run build --include-dependencies --no-deps --scope=@<package>/landing`
     - Install Command:
       - Using NPM: `npm install --prefix ../../`
       - Using Yarn: `yarn install --cwd ../../`
       - Using pnpm: `pnpm install --prefix ../../`
   - Root Directory: `apps/landing`
3. Environment Variables -> Add New
   - Name: `ENABLE_ROOT_PATH_BUILD_CACHE`
   - Value: `1`
   - Add

## Issues

### TBD

```log
Command "turbo run build" exited with 1
```

TODO
