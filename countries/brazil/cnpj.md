# Cadastro Nacional de Pessoa Jurídica (CNPJ)

<!--
https://solucoes.receita.fazenda.gov.br/servicos/cnpjreva/cnpjreva_solicitacao.asp
-->

## Terms

- Bureau de Dados

## Tools

### Search

- [Brasil API](https://brasilapi.com.br/) / [Search](https://brasilapi.com.br/api/cnpj/v1/00000000000191)
- [CNPJ.ws](https://cnpj.ws) / [Search](https://publica.cnpj.ws/cnpj/00000000000191)
- [DT Loja](http://dtloja.com.br) / [Search](http://dtloja.com.br:20000/api/cnpj/00000000000191)
- [Minha Receita](https://minhareceita.org) / [Search](https://minhareceita.org/00.000.000/0001-91)
- [Receita WS](https://receitaws.com.br) / [Search](https://receitaws.com.br/v1/cnpj/00000000000191)
- [Speedio](https://speedio.com.br) / [Search](https://api-publica.speedio.com.br/buscarcnpj?cnpj=00000000000191)

## Tips

### Throughput

```sh
#
ddosify \
  -T 5 \
  -d 10 \
  -m GET \
  -n 3000 \
  -t https://brasilapi.com.br/api/cnpj/v1/00000000000191
```
