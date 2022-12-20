# Google Kubernetes Engine (GKE)

<!--
gcp.credentials.file=${GCP_CREDENTIALS_PATH:/etc/credentials.json}

https://github.com/search?o=desc&q=path%3Amodules%2Fgke+filename%3Amain.tf&s=indexed&type=Code
-->

**Keywords:** Kubernetes Orchestration

## Docs

- [Get started using the Google Cloud CLI (GKE)](https://cloud.google.com/binary-authorization/docs/getting-started-cli)

## CLI

### Dependencies

- [gke-gcloud-auth-plugin](/gcp/gke-gcloud-auth-plugin.md)

### Commands

```sh
gcloud container --help
```

### Usage

```sh
#
gcloud config get-value project

#
gcloud container clusters list

#
gcloud container clusters get-credentials '<cluster-name>' \
  --zone '<location>'

#
gcloud container images list
```

### Tips

#### Check Permissions

```sh
kubectl auth can-i --list
```

### Issues

#### Missing Authentication

```log
Unable to connect to the server: x509: certificate signed by unknown authority
```

```sh
#
gcloud container clusters list

#
gcloud container clusters get-credentials '<cluster-name>' \
  --zone '<location>'
```
