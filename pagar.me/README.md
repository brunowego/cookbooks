# Pagar.me

<!--
## KYC

Resolução 264, Artigo 13, do Banco Central, a partir de 6 de novembro de 2023

https://docs.pagar.me/page/ambiente-de-teste-para-prova-de-vida
-->

<!--
https://www.upinside.com.br/cursos/pagamentos-com-pagar-me
https://plugins.escolaninjawp.com.br/produto/plugin-de-split-de-pagamento-pagarme-com-dokan-dashboard-2-0

https://dev.to/devdoido/gateway-de-pagamento-de-forma-generica-nao-precisa-ser-complicado-4dl2
-->

## Links

- [Org. Repository](https://github.com/pagarme)
- Console
  - [Profile](https://profile.pagar.me)
  - [Dashboard](https://dash.pagar.me)
- [Docs](https://docs.pagar.me/docs/overview-principal)
  - [Chaves de acesso](https://docs.pagar.me/docs/chaves-de-acesso)
- [Status Page](https://status.pagar.me)

## Postman

- [dark-flare-130304](https://postman.com/dark-flare-130304/mlearn/collection/b3rkn3i/mark-1-pagar-me-v5) 🌟
- [Solutions_Onboardin_GC](https://postman.com/interstellar-equinox-718029/workspace/pagar-me-2-0/folder/5268812-e6ab7fc5-8a65-4097-8095-cb3e0b2dd355)

## Library

### Links

- [Code Repository](https://github.com/pagarme/pagarme-nodejs-sdk)

### Installation

```sh
# Using pnpm
pnpm add @pagarme/pagarme-nodejs-sdk
```

<!--
https://npmjs.com/package/pagarme
-->

<!--
PAGARME_API_KEY=
-->

### Tips

#### KYC

<!--
https://www.youtube.com/watch?v=GwoPkjl77EE&t=8s

https://api.pagar.me/1/recipients/<recipient-id>/kyc_link
-->

TODO

### Issues

#### Enable split payment

```log
The account must have split settings enabled, in order to create a recipient
```

1. Configurações -> Funcionalidades
2. Funcionalidades -> Split -> Editar
3. Status: Ativo -> Salvar alterações

#### TBD

```log
Request denied. Second authentication factor is necessary.
```

TODO

#### TBD

```log
IP de origem não autorizado a realizar essa operação.
```

<!--
https://docs.pagar.me/docs/ip-allowlist

https://www.reclameaqui.com.br/pagar-me/api-https-erro-de-ip-nao-autorizado_-K36ix5yDD_uPwPy/
https://www.reclameaqui.com.br/pagar-me/ip-de-origem-nao-autorizado-a-realizar-essa-operacao_140b29xdyocoVYZc/
-->

TODO

#### TBD

```log
TypeError: Do not know how to serialize a BigInt
```

```ts
JSON.parse(
  JSON.stringify(result, (_, value) =>
    typeof value === 'bigint' ? value.toString() : value,
  ),
),
```

#### Missing Code Parameter

```log
The recipient could not be created : invalid_parameter | external_id | External ID must be unique
```

```ts
const { result } = await recipientsController.createRecipient({
  // ...
  code: '<ulid>',
})
```
