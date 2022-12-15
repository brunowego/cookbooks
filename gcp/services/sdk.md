# Google Cloud SDK

## CLI

### Installation

#### Homebrew

```sh
brew install --cask google-cloud-sdk
```

#### APT

```sh
echo 'deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main' | \
  sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg

sudo apt update
sudo apt -y install google-cloud-cli
```

<!-- #### YUM

TODO -->

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
gcloud config configurations create <org-name>

#
gcloud auth list

#
gcloud auth login

#
gcloud config set disable_usage_reporting false

#
gcloud config configurations list

#
ls ~/.config/gcloud/configurations

#
gcloud config get-value core/account

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
gcloud beta container clusters delete 'model-mgmt' --zone 'us-central1-a'
-->

### Tips

#### Rename

```sh
#
gcloud config configurations list

#
gcloud config configurations rename <current-name> --new-name <new-name>

#
gcloud config configurations activate <new-name>
```
