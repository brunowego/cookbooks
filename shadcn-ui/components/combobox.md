# Combobox

## Installation

```sh
pnpx shadcn-ui@latest add -c ./packages/ui combobox
```

## Issues

### Command Group Error

```log
TypeError: undefined is not iterable (cannot read property Symbol(Symbol.iterator))
```

<!--
https://github.com/shadcn-ui/ui/issues/1748
https://github.com/shadcn-ui/ui/issues/2944
https://github.com/shadcn-ui/ui/issues/3051
-->

<!-- Replace `data-[disabled]:...` with `aria-disabled:....` in `./packages/ui/src/components/command.tsx`. -->

Change `<CommandGroup />` to `<CommandList />`.

### TBD

```log
TypeError: Failed to execute 'appendChild' on 'Node': parameter 1 is not of type 'Node'.
```

TODO
