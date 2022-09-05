# Vercel

## Configuration

1. Project -> Settings
2. General
   - Build & Development Settings
     - Build Command:
       - Using NPM: `cd ../../ && npx turbo run build --scope=@[package]/landing --include-dependencies --no-deps`
       - Using Yarn: `cd ../../ && yarn turbo run build --scope=@[package]/landing --include-dependencies --no-deps`
     - Install Command:
       - Using NPM: `npm install --prefix ../../`
       - Using Yarn: `yarn install --cwd ../../`
   - Root Directory: `apps/landing`
3. Environment Variables -> Add New
   - Name: `ENABLE_ROOT_PATH_BUILD_CACHE`
   - Value: `1`
   - Add
