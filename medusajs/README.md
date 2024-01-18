# MedusaJS

<!--
https://github.com/bidah/universal-medusa
https://github.com/adrien2p/medusa-extender

https://medusajs.notion.site/Medusa-Resources-dc2626aa8abf4e97ae3a5293a3fd41b9

https://www.figma.com/community/file/1192103306884293603
-->

**Keywords:** Headless Commerce

![Medusa Architecture](/assets/images/medusa/medusa-arch.png)

## Links

- [Code Repository](https://github.com/medusajs/medusa)
- [Main Website](https://medusajs.com)
- [API Reference](https://docs.medusajs.com/api/store)
- [Awesome List](https://github.com/adrien2p/awesome-medusajs)
- [Demo](https://demo.medusajs.com)

<!-- ##

https://rigby.pl -->

## Glossary

- Harmonized System Code (HS Code)
- Manufacturers Identification Code (MID Code)
- Omnichannel Commerce
- Order Management System (OMS)
- Point-of-Sale (PoS)

## Showcase

- [Dubray](https://dubraybooks.ie)
- [Palmes](https://palmes.co)
- [Tekla](https://teklafabrics.com)
- [Bryant Dental](https://bryant.dental)

## CLI

### Installation

```sh
# Using NPM
npm install @medusajs/medusa-cli -g
```

### Commands

```sh
#
medusa -h

# Using NPX
npx @medusajs/medusa-cli@latest -h
```

### Usage

```sh
#
medusa telemetry --disable
# or
MEDUSA_DISABLE_TELEMETRY=true

#
medusa migrations run

#
medusa seed -f ./data/seed.json

#
medusa develop

#
medusa start

#
medusa user -e <email> --invite
```

### Issues

#### TBD

```log
Could not resolve module: cartCartSalesChannelSalesChannelLink. Error: Loaders for module cartCartSalesChannelSalesChannelLink failed: Cannot read properties of undefined (reading 'className')
```

<!--
https://github.com/medusajs/medusa/issues/5539
-->

TODO

#### TBD

```log
Error: Cannot find module 'fs-extra'
```

TODO

<!-- ```sh
npm root -g

npm list -g
``` -->
