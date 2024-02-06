# Stripe

<!--
https://github.com/quenti-io/quenti/tree/main/packages/payments
-->

## Links

- [Main Website](https://stripe.com)
- [Dashboard](https://dashboard.stripe.com)
  - [API keys](https://dashboard.stripe.com/test/apikeys)
  - [Webhooks](https://dashboard.stripe.com/test/webhooks/create?endpoint_location=local)
  - [Products](https://dashboard.stripe.com/test/products)
- Docs
  - [Testing](https://stripe.com/docs/testing)

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
stripe listen --forward-to localhost:4242/webhook
stripe listen --forward-to localhost:3000/api/webhooks/stripe

#
stripe listen -f http://localhost:3000/api/webhooks/

#
stripe listen -f http://localhost:52384/api/payments/completed/webhook
stripe listen -f http://localhost:52384/api/payments/succeeded/webhook
stripe listen -f http://localhost:52384/api/payments/failed/webhook

#
stripe customers create

#
stripe trigger payment_intent.succeeded
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

<!--
https://stripe.com/docs/testing

Card Number: 4242 4242 4242 4242
Card Validation: 12/34
CVC: 567
-->
