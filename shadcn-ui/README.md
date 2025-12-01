# shadcn/ui

**Keywords:** Radix UI, Tailwind CSS, UI Library

<!--
path:packages/ui path:components.json content:"https://ui.shadcn.com/schema.json"
-->

<!--
https://21st.dev | https://github.com/serafimcloud/21st
https://kibo-ui.com/components/table
-->

<!--
https://tinte.dev
https://shadcnmarketplace.com
https://shadcnblocks.com
https://basecn.dev
https://pro.tailark.com
https://shadcn-extension.vercel.app | https://github.com/BelkacemYerfa/shadcn-extension
https://blocks.so/stats
https://reui.io
https://ui.lndev.me
https://cult-ui.com
https://magicui.design
https://starui.link
https://mystic-ui.vercel.app
https://lotru-ui.com
https://prismui.tech
https://eldoraui.site

https://github.com/haydenbleasel/kibo | https://kibo-ui.com
https://github.com/origin-space/originui | https://originui.com

https://github.com/sadmann7/shadcn-table
https://github.com/rizzui/rizzui
-->

<!--
Storybook

https://bendigiorgio.github.io/kiso/?path=/docs/components-switch--docs
-->

## Links

- [Code Repository](https://github.com/shadcn-ui/ui)
- [Main Website](https://ui.shadcn.com)
- [Docs](https://ui.shadcn.com/docs)
  - [components.json](https://ui.shadcn.com/docs/components-json)
- [Examples](https://github.com/shadcn-ui/ui/tree/main/apps/www/app/examples)

## Learning

- [awesome-shadcn/ui](https://github.com/birobirobiro/awesome-shadcn-ui)
- [Shadcn UI Crash Course #1 - Introduction & Setup](https://youtube.com/watch?v=wcTzlJi2Oz4)

## Tools

### Themes

- [Palettify](https://palettify.co)
- [shadcn/studio](https://shadcnstudio.com/theme-editor) <!-- https://github.com/themeselection/shadcn-studio -->
- [shadcn/ui (official)](https://ui.shadcn.com/themes)
- [shadcn/ui customizer](https://shadcn-ui-customizer.vercel.app)

<!--
https://shadcn-editor.vercel.app

https://reui.io | https://github.com/keenthemes/reui
https://mynaui.com
https://tweakcn.com

https://gradient.page/tools/shadcn-ui-theme-generator
https://github.com/Tellay/shadcn-ui-themes
https://github.com/kiliman/shadcn-custom-theme
-->

## CLI

### Commands

```sh
# Using Bun
npx shadcn@latest -h
```

### Usage

```sh
#
npx shadcn@latest init
npx shadcn@latest init -c ./packages/ui

#
npx shadcn@latest add <name>
npx shadcn@latest add -c ./packages/ui <name>

#
npx shadcn@latest diff
npx shadcn@latest diff -c ./packages/ui
npx shadcn@latest diff <name>
npx shadcn@latest diff -c ./packages/ui <name>
```

<!--
✔ Would you like to use TypeScript (recommended)? … yes
✔ Which style would you like to use? › Default
✔ Which color would you like to use as base color? › Zinc
✔ Where is your global CSS file? … src/styles/globals.css
✔ Would you like to use CSS variables for colors? … yes
✔ Are you using a custom tailwind prefix eg. tw-?
✔ Where is your tailwind.config.js located? … tailwind.config.ts
✔ Configure the import alias for components: … src/components
✔ Configure the import alias for utils: … src/lib/utils
✔ Are you using React Server Components? … yes
✔ Write configuration to components.json. Proceed? yes
-->

<!--
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "extends": "@acme/typescript-config/react-library.json",
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src/**/*.ts", "src/**/*.tsx"],
  "exclude": ["dist", "node_modules"]
}
-->

### Issues

#### TBD

```log
ℹ No files updated.
```

```sh
cd ./packages/ui

# Try again
```

#### TBD

```log
An invalid components.json file was found at ./packages/ui.
```

TODO

#### TBD

```log
Error: Tailwind CSS is not installed. Visit https://tailwindcss.com/docs/installation to get started.
```

TODO
