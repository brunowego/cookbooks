# React Form

## Issues

### Unnecessary EncType or Method

```log
Warning: Cannot specify a encType or method for a form that specifies a function as the action. React provides those automatically. They will get overridden.
```

Remove `encType='multipart/form-data'` or `method='POST'` from the form tag.
