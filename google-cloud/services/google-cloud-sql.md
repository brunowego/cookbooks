# Google Cloud SQL

## Console

- [Manage resources](https://console.cloud.google.com/cloud-resource-manager)

## CLI

### Commands

```sh
gcloud sql --help
```

### Usage

```sh
#
gcloud sql tiers list

#
gcloud sql instances list

#
gcloud sql databases list --instance <instance-name>
```

<!--
https://github.com/mikemilano/k8s-reference/blob/master/gcp/cloudsql.md

gcloud sql instances create <instance-name> --tier <machine-type> --region <region>
gcloud sql users set-password root % --instance <instance-name> --password <password>
gcloud sql instances describe <instance-name>
gcloud sql users create <username> <host> --instance <instance-name> --password <password>
-->
