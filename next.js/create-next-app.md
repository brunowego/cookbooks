# Create Next App

## Links

- [Main Website](https://nextjs.org/docs/api-reference/create-next-app)

## CLI

### Commands

```sh
# Using NPM
npx create-next-app@latest -h

# Using Yarn
yarn create next-app -h
```

### Bootstrap

```sh
# Using NPM
npx create-next-app@latest \
  --ts \
  --use-npm \
  [app-name] && \
    "$_"

# Using Yarn
yarn create next-app \
  --ts \
  [app-name] && \
    "$_"
```

#### [With Examples](https://github.com/vercel/next.js/tree/canary/examples)

```sh
# Using NPM
npx create-next-app@latest \
  --ts \
  --use-npm \
  -e with-tailwindcss \
  [app-name] && \
    "$_"

# Using Yarn
yarn create next-app \
  --ts \
  -e with-tailwindcss \
  [app-name] && \
    "$_"
```

### Scaffold

```sh
#
mkdir -p ./src/{assets/images,config,constants,contexts,components,hooks,layouts,lib,types,utils}

#
mkdir -p ./test/{e2e,unit}

#
mv ./{pages,styles} ./src

# Git Ignore
cat << EOF >> ./.gitignore
/.next
/node_modules
EOF
```

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
