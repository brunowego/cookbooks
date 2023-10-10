# Create SST

## Links

- [Docs](https://docs.sst.dev/packages/create-sst)

## Dependencies

- [AWS CLI](/aws/README.md#cli)
- [AWS Account](/aws/services/account.md)
- [AWS Access Portal URL](/aws/services/sso.md#aws-access-portal-url)
- [AWS SSO](/aws/services/sso.md#configuration)

## Commands

```sh
npx create-sst@latest -h
```

<!--
https://github.com/sst/sst/tree/master/packages/create-sst/bin/presets

pnpm create sst --template=base/example ./
-->

## Usage

```sh
#
mkdir ./my-app && cd "$_"

#
pnpm create sst ./

#
pnpm install
```

## Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "aws:sso": "aws sso login --sso-session <org-name>"
    // ...
  },
  "workspaces": ["packages/*"] // REMOVE this
}
```

```sh
#
pnpm config set --local save-prefix '~'

#
pnpm install
```

**Refer:** `./sst.config.ts`

```ts
// ...

export default {
  config(_input) {
    return {
      name: '<app-name>',
      region: 'us-east-1',
      profile: '<aws-profile>',
      // profile:
      //   _input.stage === 'production' ? '<app-name>-prod' : '<app-name>-dev',
    }
  },
  // ...
} satisfies SSTConfig
```

```sh
#
pnpm aws:sso

#
pnpm dev

#
./node_modules/.bin/sst update

#
pnpm install

#
pnpm deploy --stage dev

#
pnpm remove --stage dev
```

## Issues

### TBD

```log
Error: Could not load credentials from any providers
```

TODO

### Missing Profile in Configuration

```log
Error: Could not load credentials from any providers
```

```ts
// ...
export default {
  config(_input) {
    return {
      // ...
      profile: '<aws-profile>',
    }
  },
  // ...
} satisfies SSTConfig
```
