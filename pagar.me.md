# Pagar.me

<!--
https://www.postman.com/dark-flare-130304/mlearn/collection/b3rkn3i/mark-1-pagar-me-v5
https://www.postman.com/interstellar-equinox-718029/workspace/pagar-me-2-0/request/5268812-1f38cf4f-952b-4bda-b7ba-94a2cbedc29f
-->

<!--
https://github.com/EuKaique/PetFood
https://github.com/redgar1980/e-diarista
https://github.com/treinaweb/multistack-ediaristas-react?tab=readme-ov-file
https://github.com/institutoreditus/reditus
https://github.com/Thiago-Mota-Santos/pagarmepix | https://pagarmepix.vercel.app
https://github.com/fernando-mashimo/2024-back-end-applications/tree/main/app-health_videos_full-application

https://github.com/pagarme/pagarme-nodejs-sdk/tree/main/doc/controllers
-->

<!--
Resolução 264, Artigo 13, do Banco Central, a partir de 6 de novembro de 2023

https://docs.pagar.me/page/ambiente-de-teste-para-prova-de-vida
-->

## Links

- [Org. Repository](https://github.com/pagarme)
- Console
  - [Profile](https://profile.pagar.me)
  - [Dashboard](https://dash.pagar.me)
- [Docs](https://docs.pagar.me/docs/overview-principal)
  - [Chaves de acesso](https://docs.pagar.me/docs/chaves-de-acesso)
- [Status Page](https://status.pagar.me)

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
IP de origem não autorizado a realizar essa operação.
```

<!--
https://docs.pagar.me/docs/ip-allowlist

https://www.reclameaqui.com.br/pagar-me/api-https-erro-de-ip-nao-autorizado_-K36ix5yDD_uPwPy/
https://www.reclameaqui.com.br/pagar-me/ip-de-origem-nao-autorizado-a-realizar-essa-operacao_140b29xdyocoVYZc/
-->

TODO

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
