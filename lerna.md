# Lerna

<!--
https://buttercms.com/blog/nextjs-storybook-and-lerna-build-a-monorepo-structure
https://dev.to/shnydercom/monorepos-lerna-typescript-cra-and-storybook-combined-4hli
https://medium.com/js-dojo/sharing-reusable-vue-js-components-with-lerna-storybook-and-npm-7dc33b38b011
https://medium.com/@harshverma04111989/creating-monorepo-using-lerna-dd431d0db072
-->

## npx

### Initialize

```sh
npx lerna init
```

## CLI

### Installation

#### Yarn

```sh
yarn global add lerna
```

#### NPM

```sh
npm install lerna -g
```

#### NPX

```sh
npx lerna -h
```

### Bootstrap

- [Yarn](/yarn.md#bootstrap)
- [EditorConfig](/editorconfig.md#configuration)
- [Git](/git.md#initialize)
- [NPM](/npm.md#configuration)

### Configuration

```sh
#
echo '/lerna-debug.log' >> ~/.gitignore_global

#
echo '/packages/*/node_modules' >> ./.gitignore
```

### Commands

```sh
lerna -h
```

### Usage

```sh
lerna init -i
lerna bootstrap

#
lerna create [name] -y

#
lerna run dev
lerna run dev --scope [package-name]
lerna run dev --parallel

#
lerna add [module-1] \
  --scope [module-2] \
  --dev
```
