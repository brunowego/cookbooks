# JSX

## Tools

- [Transform / HTML to JSX](https://transform.tools/html-to-jsx)

<!--
https://divmagic.com/tools/html-to-jsx
https://magic.reactjs.net/htmltojsx.htm
-->

## Issues

### Missing JSX Compiler

```log
Module '<name>' was resolved to '/absolute/path/to/file.tsx', but '--jsx' is not set. ts(6142)
```

```log
'React' refers to a UMD global, but the current file is a module. Consider adding an import instead. ts(2686)
```

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "compilerOptions": {
    // ...
    "jsx": "react-jsx"
  }
}
```
