# AWS Certificate Manager (ACM)

## Links

- [AWS Console / ACM / Certificates](https://console.aws.amazon.com/acm/home#/)

## Docs

- [Validating domain ownership](https://docs.aws.amazon.com/acm/latest/userguide/domain-ownership-validation.html)

## CLI

### Commands

```sh
aws acm help
```

### Usage

```sh
#
aws \
  --output table \
  acm list-certificates

#
aws acm describe-certificate \
  --certificate-arn <arn>
```

### Issues

#### Validating Domain Ownership

```log
Before the Amazon certificate authority (CA) can issue a certificate for your site, AWS Certificate Manager (ACM) must prove that you own or control all of the domain names that you specify in your request. You can choose to prove your ownership with either Domain Name System (DNS) validation or with email validation at the time you request a certificate. Validation applies only to publicly trusted certificates issued by ACM. ACM does not validate domain ownership for imported certificates or for certificates signed by a private CA.
```

1. AWS Certificate Manager (ACM) -> [List certificates](https://console.aws.amazon.com/acm/home#/certificates/list)
2. Select Certificate ID -> Create records in Route 53 -> Create records
3. AWS Route 53 -> [Hosted zones](https://console.aws.amazon.com/route53/v2/hostedzones#) -> Select root domain name -> Create record
   - Record type: `NS - Name servers for a hosted zone`

> Wait! This process take a while (> 30m).

```sh
dig +short _<hash>.<subdomain?>.<domain>.
```
