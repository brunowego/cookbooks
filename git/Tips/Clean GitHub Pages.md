# Clean GitHub Pages

```sh
git clone --no-checkout [repo]
```

```sh
git checkout --orphan gh-pages
```

```sh
git rm -r .
git clean -fdx
git push origin gh-pages
```
