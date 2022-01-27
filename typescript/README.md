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
    "build:types": "tsc --noEmit --pretty"
    // "typecheck": "tsc --noEmit --pretty"
  }
}
```

```sh
#
echo '*.tsbuildinfo' >> ./.gitignore
```

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.{ts,tsx}]
indent_size = 4
EOF
```

## Tips

### Visual Studio Code

**Dependencies:** [Prettier](/prettier.md#visual-studio-code)

```sh
#
jq '."[typescript]"."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"
```
