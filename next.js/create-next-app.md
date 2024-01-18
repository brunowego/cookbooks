# Create Next App

<!--
https://github.com/hackability-dev/space.hackability.it
-->

<!--
Scaffold

https://github.com/vercel/platforms
https://github.com/sadmann7/skateshop
https://github.com/makeplane/plane
https://github.com/juliusmarminge/acme-corp

https://github.com/unkeyed/unkey
https://github.com/ixahmedxi/noodle
https://github.com/chronark/highstorm
https://github.com/BloopAI/bloop
https://github.com/openstatusHQ/openstatus
-->

## Links

- [Main Website](https://nextjs.org/docs/api-reference/create-next-app)

## Project

### Commands

```sh
# Using NPM
npx create-next-app@latest -h

# Using Yarn
yarn create next-app -h

# Using pnpm
pnpm create next-app -h

# Using Bun
bun create next-app -h
```

### Bootstrap

```sh
# Using NPM
npx create-next-app@latest \
  --ts \
  --use-npm \
  <app-name> && \
    "$_"

# Using Yarn
yarn create next-app \
  --ts \
  <app-name> && \
    "$_"

# Using pnpm
pnpm create next-app \
  --ts \
  <app-name> && \
    "$_"

# Using bun
bun create next-app \
  --ts \
  <app-name> && \
    "$_"
```

#### [With Examples](https://github.com/vercel/next.js/tree/canary/examples)

```sh
# Using NPM
npx create-next-app@latest \
  --ts \
  --use-npm \
  -e with-tailwindcss \
  <app-name> && \
    "$_"

# Using Yarn
yarn create next-app \
  --ts \
  -e with-tailwindcss \
  <app-name> && \
    "$_"
```

### Scaffold

```sh
#
mkdir -p ./src/{assets/images,config,constants,contexts,components,hooks,layouts,lib,types,utils}

#
mkdir -p ./test/{e2e,unit}

# Git Ignore
cat << EOF >> ./.gitignore
/.next
/node_modules
/next-env.d.ts
EOF
```

### Extend

- [TSConfig](/next.js/extend/tsconfig.md)
- [Next.js Config](/next.js/extend/config.md)
- [ESLint](/next.js/extend/eslint.md)

<!-- ### Components

```sh
touch ./src/components/Page/{index,Header,Footer}.tsx
touch ./src/components/Button/index.tsx
``` -->

<!-- ### Special Pages

```sh
touch ./src/pages/404.tsx
``` -->

<!-- ###

```sh
touch ./src/pages/__middleware.ts
touch ./src/pages/_document.tsx
``` -->

<!--
# ESLint Ignore
echo '/.next' >> ./.eslintignore
-->
