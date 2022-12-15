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

## Issues

### Incompatibility with Kubectl Version

```log
W1205 10:14:27.717264   31189 gcp.go:119] WARNING: the gcp auth plugin is deprecated in v1.22+, unavailable in v1.26+; use gcloud instead.
```

```sh
# If using kbenv
brew link --overwrite kbenv
# or
kbenv use 1.23.8
```
