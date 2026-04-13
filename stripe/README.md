# Stripe

<!--
https://github.com/quenti-io/quenti/tree/main/packages/payments
-->

**Keywords:** Financial Service

## Links

- [Main Website](https://stripe.com)
- [Dashboard](https://dashboard.stripe.com)
  - [Transactions](https://dashboard.stripe.com/test/payments)
  - [API keys](https://dashboard.stripe.com/test/apikeys)
  - [Webhooks](https://dashboard.stripe.com/test/webhooks/create?endpoint_location=local)
  - [Products](https://dashboard.stripe.com/test/products?active=true)
  - [Settings]
    - [Team and security](https://dashboard.stripe.com/settings/team)
- Docs
  - [Testing](https://docs.stripe.com/testing)
    - [Cards by brand](https://docs.stripe.com/testing#cards-by-brand)

## Docs

- [Developer Tools / Webhooks](https://stripe.com/docs/webhooks/test)

## CLI

### Installation

```sh
# Using Homebrew
brew tap stripe/stripe-cli
brew install stripe

# Using Scoop
scoop bucket add stripe https://github.com/stripe/scoop-stripe-cli.git
scoop install stripe
```

### Commands

```sh
stripe help
```

### Configuration

<!--
--project-name=<project-name>
-->

```sh
#
stripe login

#
stripe config --list
#
cat ~/.config/stripe/config.toml
```

### Usage

```sh
#
stripe customers list --project-name=<project-name>
```

<!--
#
stripe listen --forward-to localhost:4242/webhook
stripe listen --forward-to localhost:3000/api/webhooks/stripe

#
stripe listen -f http://localhost:3000/api/webhooks

#
stripe listen -f http://localhost:52384/api/payments/completed/webhook
stripe listen -f http://localhost:52384/api/payments/succeeded/webhook
stripe listen -f http://localhost:52384/api/payments/failed/webhook

#
stripe customers create

#
stripe trigger payment_intent.succeeded
-->

### Tips

#### Promotion Codes

```sh
#
stripe coupons list --project-name=<project-name>

#
stripe promotion_codes create --promotion.coupon=<coupon-id> --promotion.type=coupon --code=100DISCOUNT --project-name=<project-name>
```

#### Coupons

<!--
--project-name=<project-name>
-->

```sh
#
stripe coupons create --percent-off=100 --duration=forever --max-redemptions=1 --name='100% Discount' --project-name=<project-name>

#
stripe subscriptions update <sub_id> --coupon=<coupon_id> --project-name=<project-name>
```

#### Upgrade

```sh
# Using Homebrew
brew upgrade stripe
```

## Node.js Library

### Installation

```sh
# Using pnpm
pnpm add @stripe/react-stripe-js @stripe/stripe-js stripe

# Using Bun
bun add @stripe/react-stripe-js @stripe/stripe-js stripe
```

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

<!--
stripe billing_portal_configurations create \
  --features.subscription_update.enabled=true \
  --features.subscription_update.default_allowed_updates[0]=price \
  --features.subscription_cancel.enabled=true \
  --business-profile.headline="Manage your Swite subscription"
-->
