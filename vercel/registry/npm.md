# NPM Registry

## Learn

- [How do I use private dependencies with Vercel?](https://vercel.com/guides/using-private-dependencies-with-vercel)

<!--
https://github.com/vercel/vercel/discussions/5016

NPM_RC=
NPM_TOKEN=
-->

## Issues

### Missing GitHub Token

```log
 ERR_PNPM_FETCH_401  GET https://npm.pkg.github.com/download/@acme/typescript-config/0.0.1/5def2b0b8eb75732190308faae937be637b78249: Unauthorized - 401
```

```sh
cat << EOF > ./.npmrc
//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
@acme:registry=https://npm.pkg.github.com/
EOF
```
