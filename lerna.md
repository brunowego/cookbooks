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

## References

- [Conventional Commits](/conventionalcommits.md)

## npx

### Initialize

```sh
npx lerna init
```

## CLI

### Installation

#### Yarn

```sh
yarn add lerna -D
```

#### NPM

```sh
npm install lerna -D
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
#
lerna init -i

#
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

```json
{
  "scripts": {
    "postinstall": "lerna bootstrap",
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
