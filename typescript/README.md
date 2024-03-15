# TypeScript

<!--
https://app.pluralsight.com/library/courses/react-apps-typescript-building/table-of-contents
https://app.pluralsight.com/library/courses/getting-started-typescript/table-of-contents

https://github.com/adotando-pet/monorepo/tree/840301e005f024892e9ce7dd6640525010308596

https://app.pluralsight.com/paths/skills/typescript-core-language
https://app.pluralsight.com/library/courses/typescript-compiler/table-of-contents

https://blog.logrocket.com/types-vs-interfaces-in-typescript/

https://linkedin.com/learning/typescript-essential-training/

https://linkedin.com/learning/learning-typescript-2/
https://linkedin.com/learning/typescript-object-oriented-programming/

https://linkedin.com/learning/typescript-upgrades-and-features/
https://linkedin.com/learning/typescript-for-node-js-developers/
-->

<!--
// @ts-expect-error debouncedValue is not React.ChangeEvent<HTMLInputElement>
-->

## References

- [Basic Types](https://www.typescriptlang.org/docs/handbook/basic-types.html)
- [DefinitelyTyped](https://definitelytyped.org/)
- [How to use ESLint with TypeScript](https://khalilstemmler.com/blogs/typescript/eslint-for-typescript/)

## Tools

- [Protobuf to TypeScript](https://geotho.github.io/protobuf-to-typescript/)

## Library

### Installation

#### NPM

```sh
# Using NPM
npm install typescript --save-dev
```

### Commands

```sh
npx tsc -h
```

### Usage

```sh
#
npx tsc --init
```

<!--
{
  "compilerOptions": {
    "removeComments": true,
    "preserveConstEnums": true,
    "alwaysStrict": true,
    "strictNullChecks": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitAny": true,
    "noImplicitReturns": true,
    "noImplicitThis": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "allowUnreachableCode": false,
    "noFallthroughCasesInSwitch": true,
    "outDir": "out",
    "declaration": true,
    "sourceMap": true,
    "allowSyntheticDefaultImports": true,
  },
}
-->

### Tips

#### Using with lint-staged

Add `'**/*.ts?(x)': () => 'npm run build-types'` to `.lintstagedrc.mjs`.

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "typecheck": "tsc --pretty --noEmit"
  }
}
```

```sh
#
echo '/*.tsbuildinfo' >> ./.gitignore
```

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.{ts,tsx}]
indent_size = 4
EOF
```

### Issues

#### Missing TypeScript

```log
sh: tsc: command not found
```

Missing `typescript` package.

#### Missing TSConfig File

```log
error TS6053: File '@acme/tsconfig/base.json' not found.
```

Rollback `typescript` to version `~5.2.2`.

#### TBD

```log
TSError: ⨯ Unable to compile TypeScript:
error TS6053: File '@acme/tsconfig/base.json' not found.
```

<!--
https://github.com/TypeStrong/ts-node/issues/2076
-->

Downgrade `typescript` package from version `5.3.x` to `5.2.2`.

#### Not Assignable to Type String

```log
Type 'string | undefined' is not assignable to type 'string'. Type 'undefined' is not assignable to type 'string'. ts(2322)
```

**Refer:** `./src/types/env.d.ts`

```ts
declare namespace NodeJS {
  export interface ProcessEnv {
    readonly SITE_URL: string | undefined
  }
}
```

#### Missing Module Declaration for SVG

```log
Cannot find module '@/assets/images/logo.svg' or its corresponding type declarations. ts(2307)
```

TODO

```log
Cannot find module '@/assets/images/logo.svg?url' or its corresponding type declarations. ts(2307)
```

**Refer:** `./apps/site/src/types/images.d.ts`

```ts
declare module '*.svg?url' {
  const url: string

  export default url
}
```

## Tips

### Visual Studio Code

**Dependencies:** [Prettier](/prettier.md#visual-studio-code)

```sh
#
jq '."[typescript]"."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

<!--
"eslint.nodePath": "./.yarn/sdks",
"typescript.tsdk": "./.yarn/sdks/typescript/lib",
"typescript.enablePromptUseWorkspaceTsdk": true
-->

<!--
src/types.d.ts

declare module 'konsta/config'
-->
