# Cadastro Nacional de Pessoa Jurídica (CNPJ)

<!--
https://solucoes.receita.fazenda.gov.br/servicos/cnpjreva/cnpjreva_solicitacao.asp
-->

<!--
US

Taxpayer Identification Number (TIN)
Employer Identification Number (EIN)
Internal Revenue Service (IRS)
Company Registration Number (CRN)
Individual Taxpayer Identification Number (ITIN)
Central Index Key (CIK)
Standard Industrial Classification (SIC)
-->

<!--
EIN number (Taxpayer Identification Number)

9-digit EIN numer

EIN/TAX ID : 770493581 : GOOGLE LLC

https://hipaaspace.com/ein/ein_verification/770493581

https://dev.einsearch.com/#cb6939f7-29ef-40ce-8f1e-27f8787c6841
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

<!--
https://gov.br/conecta/catalogo/apis/consulta-cnpj/swagger_cnpj.json/swagger_view#tag/cnpj/paths/~1api-cnpj-empresa~1v2~1empresa~1{CNPJempresa}/get
-->

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
