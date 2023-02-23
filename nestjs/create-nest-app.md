# Create Nest App

<!--
https://github.com/royib/clean-architecture-nestJS
-->

<!--
nest-env.d.ts
env.d.ts
-->

## References

- [Configuration Defaults](https://github.com/nestjs/nest-cli/blob/master/lib/configuration/defaults.ts)

## CLI

### Commands

```sh
pnpx @nestjs/cli new -h
```

### Bootstrap

```sh
#
pnpx @nestjs/cli new \
  -gs \
  -l TypeScript \
  -p pnpm \
  --strict \
  ./<api-name> && \
    "$_"
```

#### Using Boilerplate

```sh
#
git clone \
  --branch nestjs-base \
  https://github.com/brunowego/boilerplates.git \
  nestjs-base && \
    cd "$_"
```
