# Google Cloud SDK

## CLI

### Installation

#### Homebrew

```sh
brew install --cask google-cloud-sdk
```

### Commands

```sh
gcloud --help
```

### Usage

```sh
#
gcloud auth login

#
gcloud config get-value core/account

#
gcloud config set project [project-id]

#
gcloud config set run/region [region]

#
gcloud auth configure-docker

#
gcloud info

#
gcloud beta container clusters create 'model-mgmt' \
  --cluster-version '1.12.8-gke.10' \
  --zone 'us-central1-a' \
  --machine-type 'n1-standard-2' \
  --image-type 'COS' \
  --disk-size '10' \
  --network 'default'

#
gcloud beta container clusters list

#
gcloud container clusters get-credentials 'model-mgmt' --zone 'us-central1-a'

#
gcloud beta container clusters delete 'model-mgmt' --zone 'us-central1-a'
```
