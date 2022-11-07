# Google Cloud SDK

## CLI

### Installation

#### Homebrew

```sh
brew install --cask google-cloud-sdk
```

#### Chocolatey

```sh
choco install -y gcloudsdk
```

### Commands

```sh
gcloud --help
```

### Usage

```sh
#
gcloud info

#
gcloud auth login
gcloud auth application-default login

#
gcloud config get-value core/account

#
cat ~/.config/gcloud/application_default_credentials.json

#
gcloud projects list

#
gcloud projects create <unique-name>

#
gcloud config set project <project-id>

#
gcloud config get-value compute/region
gcloud config get-value compute/zone

#
gcloud config set compute/region us-west1
gcloud config set compute/zone us-west1-a
```

<!--
#
gcloud config set run/region <region>

#
gcloud auth configure-docker

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
-->
