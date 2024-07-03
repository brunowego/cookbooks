# Dialog

## Issues

### TBD

```log
<body class="__className_e04c4e" style="pointer-events: none;">...</body>
```

<!--
https://github.com/shadcn-ui/ui/issues/3461
https://github.com/radix-ui/primitives/issues/1241
-->

TODO

<!--
onClick={() => {
  setTimeout(() => {
    document.body.style.pointerEvents = ''
  }, 500)
}}
-->

<!--
const ModalRoot = forwardRef(({ onOpenChange = () => {}, ...props }, ref) => {
  return (
    <ModalPrimitive.Root
      onOpenChange={(e) => {
        setTimeout(() => (document.body.style.pointerEvents = ''), 0)

        onOpenChange?.(e)
      }}
      ref={ref}
      {...props}
    />
  )
})
ModalRoot.displayName = ModalPrimitive.Root.displayName
-->

### TBD

```log
Skipping auto-scroll behavior due to `position: sticky` or `position: fixed` on element: <div style=​"top:​ 0px;​ right:​ 0px;​ position:​ fixed;​ transform:​ translateX(280px)​;​ z-index:​ 99999;​">​…​</div>
...
InnerScrollAndFocusHandler
```

<!--
https://github.com/shadcn-ui/ui/issues/1355
-->

TODO

<!--
<Link scroll={false} ... />
-->
