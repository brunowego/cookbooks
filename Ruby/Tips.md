# Tips

## No document

```sh
echo 'gem: --no-document' > ~/.gemrc
```

## Remove documentation

```sh
rm -fR $(gem env gemdir)/doc/*
```
