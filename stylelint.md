# stylelint

## CLI

### Tips

#### Visual Studio Code

```sh
code --install-extension thibaudcolas.stylelint
```

#### Ignore

```scss
.foo {
  /* stylelint-disable */
  color: red;
  /* stylelint-enable */
}
```

```scss
.foo {
  color: red !important; /* stylelint-disable-line declaration-no-important */
}
```

```scss
.foo {
  /* stylelint-disable-next-line declaration-no-important */
  color: red !important;
}
```
