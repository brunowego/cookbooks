# Lerna

<!--
https://github.com/wixplosives/sample-monorepo
https://github.com/julianiff/living-styleguide/tree/19fb7227e7da3501d3f24e3866cb5ecfb1cbd4c2

https://buttercms.com/blog/nextjs-storybook-and-lerna-build-a-monorepo-structure
https://dev.to/shnydercom/monorepos-lerna-typescript-cra-and-storybook-combined-4hli
https://medium.com/js-dojo/sharing-reusable-vue-js-components-with-lerna-storybook-and-npm-7dc33b38b011
https://medium.com/@harshverma04111989/creating-monorepo-using-lerna-dd431d0db072
https://github.com/AlexSav94/lerna-ci-example/tree/5b74d7af74c8573e7ca660211f762a55aeb12df9
-->

## Alternatives

- [Monorepo Tools](/monorepo.md#tools)

## Library

### Installation

```sh
# Using NPM
npm install lerna --save-dev

# Using Yarn
yarn add lerna --dev
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
npx lerna -h
```

### Usage

```sh
#
npx lerna init -i

#
npx lerna bootstrap

#
npx lerna create [name] -y

#
npx lerna run dev
npx lerna run dev --scope [package-name]
npx lerna run dev --parallel

#
npx lerna add [module-1] \
  --scope [module-2] \
  --dev
```

### Configuration

```json
{
  "command": {
    "bootstrap": {
      "hoist": true
    },
    "publish": {
      "push": false,
      "conventionalCommits": true,
      "message": "chore(release): publish"
    },
    "version": {
      "push": false,
      "conventionalCommits": true,
      "message": "chore(release): bump version"
    }
  }
}
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    "postinstall": "lerna bootstrap"
  }
}
```

```sh
sort-package-json
```

### Docs

#### Dependency on root before publish

```json
{
  "devDependencies": {
    "@[vendor]/[package-name]": "file:./packages/[package-name]"
  }
}
```
