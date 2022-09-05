# Stripe

## Links

- [Main Website](https://stripe.com/)

## Docs

- [Developer Tools / Webhooks](https://stripe.com/docs/webhooks/test)

## CLI

### Installation

#### Homebrew

```sh
brew tap stripe/stripe-cli
brew install stripe
```

### Commands

```sh
stripe help
```

### Usage

```sh
#
stripe login
```

<!--
#
stripe listen -f http://localhost:3000/api/webhooks

#
stripe listen -f http://localhost:52384/api/payments/completed/webhook
stripe listen -f http://localhost:52384/api/payments/succeeded/webhook
stripe listen -f http://localhost:52384/api/payments/failed/webhook

#
stripe customers create
-->

## Python Library

### Installation

#### pip

```sh
pip3 install -U stripe
```

### Usage

```sh
python3 ./manage.py migrate
```
