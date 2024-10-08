# Stripe Fixtures

## Commands

```sh
stripe fixtures -h
```

## Usage

```sh
#
stripe login
```

**Refer:** `./stripe-fixtures.json`

```json
{
  "_meta": {
    "template_version": 0
  },
  "fixtures": [
    {
      "name": "prod_hobby",
      "path": "/v1/products",
      "method": "post",
      "params": {
        "name": "Hobby",
        "description": "Hobby product description",
        "metadata": {
          "index": 0
        }
      }
    },
    {
      "name": "price_hobby_month",
      "path": "/v1/prices",
      "method": "post",
      "params": {
        "product": "${prod_hobby:id}",
        "currency": "usd",
        "billing_scheme": "per_unit",
        "unit_amount": 1000,
        "recurring": {
          "interval": "month",
          "interval_count": 1
        }
      }
    },
    {
      "name": "price_hobby_year",
      "path": "/v1/prices",
      "method": "post",
      "params": {
        "product": "${prod_hobby:id}",
        "currency": "usd",
        "billing_scheme": "per_unit",
        "unit_amount": 10000,
        "recurring": {
          "interval": "year",
          "interval_count": 1
        }
      }
    },
    {
      "name": "prod_freelancer",
      "path": "/v1/products",
      "method": "post",
      "params": {
        "name": "Freelancer",
        "description": "Freelancer product description",
        "metadata": {
          "index": 1
        }
      }
    },
    {
      "name": "price_freelancer_month",
      "path": "/v1/prices",
      "method": "post",
      "params": {
        "product": "${prod_freelancer:id}",
        "currency": "usd",
        "billing_scheme": "per_unit",
        "unit_amount": 2000,
        "recurring": {
          "interval": "month",
          "interval_count": 1
        }
      }
    },
    {
      "name": "price_freelancer_year",
      "path": "/v1/prices",
      "method": "post",
      "params": {
        "product": "${prod_freelancer:id}",
        "currency": "usd",
        "billing_scheme": "per_unit",
        "unit_amount": 20000,
        "recurring": {
          "interval": "year",
          "interval_count": 1
        }
      }
    }
  ]
}
```

```sh
#
stripe listen -f localhost:3000/api/webhooks

#
stripe trigger product.updated

#
stripe fixtures ./stripe-fixtures.json
```
