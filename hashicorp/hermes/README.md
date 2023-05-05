# Hashicorp Hermes

**Keywords:** Document Management System

## Links

- [Code Repository](https://github.com/hashicorp-forge/hermes)

## Articles

- [Introducing Hermes, An Open Source Document Management System](https://hashicorp.com/blog/introducing-hermes-an-open-source-document-management-system)
- [Writing Practices and Culture](https://works.hashicorp.com/articles/writing-practices-and-culture)
- [Manager Journey](https://works.hashicorp.com/articles/manager-charter)
- Resources
  - [PRD Template](https://works.hashicorp.com/articles/prd-template)
  - [RFC Template](https://works.hashicorp.com/articles/rfc-template)

## Glossary

- Problem Requirements Document (PRD)
- Request For Comment (RFC)

## Docker

### Setup

```sh
#
git clone https://github.com/hashicorp-forge/hermes.git hermes && cd "$_"

#
cp ./configs/config.hcl ./

#
yarn set version stable

#
make build

#
make docker/postgres/start

#
./hermes server -config=config.hcl
```
