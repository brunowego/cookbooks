# gke-gcloud-auth-plugin

<!--
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
-->

## Dependencies

- Ubuntu
  - [cURL](/curl.md)
  - [GNU Privacy Guard (GnuPG / GPG) or GNU Pretty Good Privacy (PGP)](/gnu-pg.md)

## Installation

### Google Cloud Components

```sh
gcloud components install gke-gcloud-auth-plugin --quiet
```

### APT

```sh
echo 'deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main' | \
  sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg

sudo apt update
sudo apt -y install google-cloud-sdk-gke-gcloud-auth-plugin
```

<!-- ### YUM

```sh
sudo yum install google-cloud-sdk-gke-gcloud-auth-plugin
``` -->

## Commands

```sh
gke-gcloud-auth-plugin --help
```
