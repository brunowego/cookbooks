# Google Kubernetes Engine (GKE)

<!--
filename:.yml path:.github/workflows "google-github-actions" "get-gke-credentials" "setup-gcloud" "kustomize" "setup-kustomize"
-->

## Docs

- [Deploying to Google Kubernetes Engine](https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-google-kubernetes-engine)

<!--
https://github.com/kontaras/LegendaryStats/blob/master/.github/workflows/deploy-prod.yml
https://github.com/docwhite/dreamdrugs/blob/master/.github/workflows/deploy.yml
https://github.com/samisams1/gritview.io/blob/main/.github/workflows/google.yml

https://github.com/coordinadora-mercantil/gke-github-runners/blob/master/.github/workflows/deploy.yml

https://github.com/jpcano1/fastapi_kubernetes/blob/master/.github/workflows/cd-workflow.yml
-->

## Workflow

**Refer:** `./.github/workflows/gke.yml`

```yml
---
name: Build and Push to GCP

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:

env:
  PROJECT_ID: ${{ secrets.PROJECT_ID }}
  IMAGE_NAME: ${{ github.event.repository.name }}
  REGION: ${{ secrets.REGION }}
  REPOSITORY: ${{ secrets.REPOSITORY }}
  GKE_CLUSTER: ${{ secrets.GKE_CLUSTER }}
  DEPLOYMENT_NAME: fastapi-kubernetes-deployment

jobs:
  build:
    name: Build and Push to Container Registry
    runs-on: ubuntu-22.04
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4
        # with:
        #   fetch-depth: 0

      - name: Authenticate to Google Cloud
        id: 'auth'
        uses: google-github-actions/auth@v0
        with:
          credentials_json: ${{ secrets.GCP_CREDENTIALS }}

      - uses: google-github-actions/setup-gcloud@v0
        name: Setup Google Cloud Project Config
        with:
          project_id: ${{ env.PROJECT_ID }}

      - name: Build Docker Image
        run: docker build -t $IMAGE_NAME:latest .

      - name: Configure Docker Client
        run: |-
          gcloud auth configure-docker --quiet
          gcloud auth configure-docker ${{ env.REGION }}-docker.pkg.dev --quiet

      - name: Push Docker Image to Artifact Registry
        env:
          GIT_TAG: v0.1.0
        run: |-
          docker tag $IMAGE_NAME:latest $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE_NAME:latest
          docker tag $IMAGE_NAME:latest $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE_NAME:$GIT_TAG
          docker push $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE_NAME:latest
          docker push $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE_NAME:$GIT_TAG

  deploy:
    needs: build
    name: Deploy to Kubernetes Engine
    runs-on: ubuntu-22.04
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4
        # with:
        #   fetch-depth: 0

      - name: Authenticate to Google Cloud
        id: 'auth'
        uses: google-github-actions/auth@v0
        with:
          credentials_json: ${{ secrets.GCP_CREDENTIALS }}

      - name: Setup GKE Credentials
        uses: google-github-actions/get-gke-credentials@v0
        with:
          cluster_name: ${{ env.GKE_CLUSTER }}
          location: ${{ env.REGION }}

      - name: Setup Kustomize
        uses: imranismail/setup-kustomize@v1
        with:
          kustomize-version: 4.5.7

      - name: Deploy
        working-directory: kubernetes
        run: |-
          kustomize edit set image REGION-docker.pkg.dev/PROJECT_ID/REPOSITORY/IMAGE_NAME:latest=$REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE_NAME:latest
          kustomize build ./ | kubectl apply -f -
          kubectl rollout status deployment/$DEPLOYMENT_NAME
```
