# shadcn/ui

**Keywords:** Radix UI, Tailwind CSS

<!--
path:packages/ui path:components.json content:"https://ui.shadcn.com/schema.json"
-->

<!--
https://github.com/rizzui/rizzui
-->

## Links

- [Code Repository](https://github.com/shadcn-ui/ui)
- [Main Website](https://ui.shadcn.com)
- [Docs](https://ui.shadcn.com/docs)
  - [components.json](https://ui.shadcn.com/docs/components-json)
- [Examples](https://github.com/shadcn-ui/ui/tree/main/apps/www/app/examples)

## Learning

- [Shadcn UI Crash Course #1 - Introduction & Setup](https://youtube.com/watch?v=wcTzlJi2Oz4)

## Tools

### Themes

- [Palettify](https://palettify.co)
- [shadcn/ui (official)](https://ui.shadcn.com/themes)
- [shadcn/ui customizer](https://shadcn-ui-customizer.vercel.app)

<!--
https://gradient.page/tools/shadcn-ui-theme-generator
https://github.com/Tellay/shadcn-ui-themes
https://github.com/kiliman/shadcn-custom-theme
-->

## CLI

### Commands

```sh
# Using Bun
bunx shadcn-ui@latest -h
```

#131314

### Usage

```sh
#
bunx shadcn-ui@latest init
bunx shadcn-ui@latest init -c ./packages/ui

#
bunx shadcn-ui@latest add <name>
bunx shadcn-ui@latest add -c ./packages/ui <name>

#
bunx shadcn-ui@latest diff
bunx shadcn-ui@latest diff -c ./packages/ui
bunx shadcn-ui@latest diff <name>
bunx shadcn-ui@latest diff -c ./packages/ui <name>
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
