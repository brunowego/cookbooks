# Puck

<!--
Blocks

https://github.com/distributeaid/next-website/tree/saga/src/components
https://github.com/Tohuhono/Oberon/tree/main/puck/blocks/src

https://github.com/ivy-lli/my-puck/blob/51715c8deaf4fc28d5d531bae1c0b64e47bd53bc/puck.config.tsx#L4
https://github.com/georgetown-tech/reroto/blob/main/lib/puck.tsx
https://github.com/nguyendhst/low-code-monorepo/tree/dev/apps/web/app/%5BprojectId%5D/edit/_components/blocks
https://github.com/apav-dev/puck-pages/tree/main/src/config/blocks
https://github.com/tinnguyenhuuletrong/Learning/tree/master/puck-editor-play/src/configs/blocks
https://github.com/OsamuBlack/osamu-firecms/tree/master/puckConfig/components
https://github.com/glidaa/NDIS/tree/main/app/components/blocks
https://github.com/OsamuBlack/osamu-firecms/tree/master/puckConfig/components
https://github.com/nguyendhst/low-code-monorepo/tree/dev/apps/web/app/%5BprojectId%5D/edit/_components/blocks
https://github.com/OsamuBlack/osamu-firecms/tree/master/puckConfig/components
-->

<!--
https://github.com/distributeaid/next-website/blob/saga/src/components/Markdown.tsx

https://github.com/OsamuBlack/osamu-firecms/blob/master/puckConfig/fields/colorPicker.tsx
https://github.com/OsamuBlack/osamu-firecms/tree/master/puckConfig/fields/background
https://github.com/OsamuBlack/osamu-firecms/blob/master/puckConfig/fields/slider.tsx
https://github.com/OsamuBlack/osamu-firecms/blob/master/puckConfig/fields/switch.tsx
https://github.com/OsamuBlack/osamu-firecms/blob/master/puckConfig/fields/textArea.tsx
https://github.com/OsamuBlack/osamu-firecms/blob/master/puckConfig/fields/textField.tsx
https://github.com/OsamuBlack/osamu-firecms/blob/master/puckConfig/fields/tooltip.tsx
-->

<!--
https://react-page.github.io
-->

<!--
Examples

https://github.com/nguyendhst/low-code-monorepo
-->

<!--
Blocks

https://github.com/measuredco/puck/tree/main/apps/demo/config/blocks
-->

## Links

- [Code Repository](https://github.com/measuredco/puck)
- [Main Website](https://puckeditor.com)
- [Docs](https://puckeditor.com/docs)
- [Demo](https://demo.puckeditor.com/edit)
  - [Custom UI](https://demo.puckeditor.com/custom-ui/edit)

## Learn

- [Awesome List](https://github.com/measuredco/awesome-puck)
- [Building a React Page Builder: An Introduction to Puck / Adding Tailwind](https://measured.co/blog/building-a-react-page-builder-an-introduction-to-puck#adding-tailwind)

## Made with Puck

- [Power Stack](https://powerstack.dev) <!-- https://github.com/powerstackdev/power-stack -->
- [Ward Bulletin](https://beta.wardbulletin.app/editdemo)
- [WithUI](https://withui.com/ui-demo)

<!--
https://pablo-123456789.stripedemos.com | https://pablo-123456789.stripedemos.com/How-to/edit
-->

## Library

### Installation

```sh
# Using pnpm
pnpm add @measured/puck
```

### Issues

#### Defining props on `root` is deprecated

```log
Warning: Defining props on `root` is deprecated. Please use `root.props`. This will be a breaking change in a future release.
```

```tsx
<Puck
  // ...
  data={{
    // ...
    root: {
      props: {
        title: 'New Page',
      },
    },
    // ...
  }}
  // ...
/>
```
