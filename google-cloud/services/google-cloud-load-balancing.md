# Google Cloud Load Balancing

## Docs

- [SSL policies for SSL and TLS protocols](https://cloud.google.com/load-balancing/docs/ssl-policies-concepts)

## Glossary

- Data Security Standard (DSS)
- Network Load Balancing (NLB)
- Payment Card Industry (PCI)

## CLI

### Usage

```sh
#
gcloud beta compute target-https-proxies list
```

<!--
gcloud beta compute ssl-policies create pci_dss_ssl_policy --min-tls-version 1.2

gcloud beta compute target-https-proxies update NAME_OF_HTTPS_TARGET --ssl-policy pci_dss_ssl_policy
-->

<!--
https://medium.com/google-cloud/secure-google-cloud-platform-connections-and-tls-1-0-d1ad16851dfb

https://serverfault.com/questions/768816/is-there-any-way-to-disable-at-least-tls-1-0-in-gce-https-load-balancer
-->
