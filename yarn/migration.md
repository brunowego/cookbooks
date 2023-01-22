# Yarn Migration

## Links

- [Migration](https://yarnpkg.com/getting-started/migration)
- [Zero-Installs](https://yarnpkg.com/features/zero-installs)
- [Which files should be gitignored?](https://yarnpkg.com/getting-started/qa#which-files-should-be-gitignored)

## Migrate

```sh
#
yarn init -yp; yarn

#
yarn set version stable # berry

#
yarn config set defaultSemverRangePrefix '~'
yarn config set enableImmutableInstalls true

#
yarn install

#
cat << EOF >> ./.gitattributes
/.yarn/releases/** binary
/.yarn/plugins/** binary
EOF
```

### Using Node Modules 🌟

```sh
#
yarn config set nodeLinker 'node-modules'

#
cat << EOF >> ./.gitignore
/.yarn/*
!/.yarn/patches
!/.yarn/plugins
!/.yarn/releases
!/.yarn/sdks
!/.yarn/versions
EOF
```

### Using Plug’n’Play (PnP)

```sh
#
yarn config set nodeLinker 'pnp'

#
cat << EOF >> ./.gitignore
/.yarn/*
!/.yarn/patches
!/.yarn/plugins
!/.yarn/releases
!/.yarn/sdks
!/.yarn/versions
/.pnp.*
EOF
```

#### Remnants of `node_modules` folder

```sh
#
sed -i '/\/node_modules/d' ./.gitignore

#
sed -i 's/node_modules/.yarn/' ./tsconfig.json

#
sed -i 's/node_modules/.yarn/' ./.yamllint.yaml
```

## Tips

### Editor Yarn Plug’n’Play (PnP) SDKs

- [Editor SDKs](https://yarnpkg.com/getting-started/editor-sdks)

```sh
#
yarn dlx @yarnpkg/sdks vscode

#
code \
  --install-extension arcanis.vscode-zipfs \
  --install-extension dbaeumer.vscode-eslint
```
