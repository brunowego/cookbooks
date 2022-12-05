# Google Cloud Load Balancing

## Docs

- [SSL policies for SSL and TLS protocols](https://cloud.google.com/load-balancing/docs/ssl-policies-concepts)

## Glossary

- Data Security Standard (DSS)
- Network Load Balancing (NLB)
- Payment Card Industry (PCI)

## CLI

### Dependencies

```sh
gcloud components install beta
```

### Usage

```sh
#
gcloud beta compute target-https-proxies list

#
gcloud beta compute target-https-proxies describe <name>

#
gcloud beta compute ssl-certificates list

#
gcloud beta compute ssl-certificates describe <name>
```

<!--
gcloud beta compute ssl-certificates create
-->

<!--
gcloud beta compute target-ssl-proxies list
-->

<!--
gcloud beta compute target-https-proxies create

gcloud beta compute target-https-proxies export

gcloud beta compute target-https-proxies import

gcloud beta compute target-https-proxies update NAME_OF_HTTPS_TARGET --ssl-policy pci_dss_ssl_policy
-->

<!--
gcloud beta compute ssl-policies list

gcloud beta compute ssl-policies list-available-features

gcloud beta compute ssl-policies create pci_dss_ssl_policy --min-tls-version 1.2

gcloud beta compute ssl-policies describe

gcloud beta compute ssl-policies update
-->

<!--
https://medium.com/google-cloud/secure-google-cloud-platform-connections-and-tls-1-0-d1ad16851dfb

https://serverfault.com/questions/768816/is-there-any-way-to-disable-at-least-tls-1-0-in-gce-https-load-balancer
-->

### Tips

#### Disable TLS v1.0 and v1.1

TODO

<!--
1. [GCP Console](https://console.cloud.google.com)
2. Navigate to [SSL Policies](https://console.cloud.google.com/net-security/sslpolicies)
-->

<!--
https://docs.bridgecrew.io/docs/bc_gcp_networking_3
https://cloud.google.com/load-balancing/docs/use-ssl-policies
https://cloud.google.com/load-balancing/docs/https/setting-up-https-serverless
https://serverfault.com/questions/1003762/how-to-disable-tls-1-0-for-google-app-engine
-->

<!-- ```sh
#
gcloud compute ssl-policies update <name> \
  --min-tls-version 1.2 \
  --custom-features <features>

gcloud compute target-ssl-proxies update <name>
  --ssl-policy <name>

gcloud compute target-https-proxies update <name>
  --sslpolicy <name>
``` -->
