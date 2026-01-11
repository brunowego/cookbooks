# Google Cloud Run

## Links

- [Console](https://console.cloud.google.com/run/overview)

## CLI

```sh
#
gcloud secrets create dockerhub-auth \
  --replication-policy="automatic"

#
printf '{"username":"<docker-hub-username>","password":"<docker-hub-token>"}' \
  | gcloud secrets versions add dockerhub-auth --data-file=-

#
gcloud secrets create ghcr-auth \
  --replication-policy="automatic"

#
printf '{"username":"<github-username>","password":"<github-token>"}' | \
  gcloud secrets versions add ghcr-auth --data-file=-

#
gcloud run deploy waha \
  --image=ghcr.io/brunowego/waha-plus:gows-2025.11.4 \
  --region=us-east1 \
  --platform=managed \
  --allow-unauthenticated \
  --docker-auth=ghcr-auth \
  --port=3000 \
  --max-instances=3 \
  --min-instances=0 \
  --set-env-vars=WAHA_PORT=3002 \
  --set-env-vars=WAHA_API_KEY=admin \
  --set-env-vars=WAHA_DASHBOARD_USERNAME=admin \
  --set-env-vars=WAHA_DASHBOARD_PASSWORD=admin \
  --set-env-vars=WAHA_DASHBOARD_NO_PASSWORD=True \
  --set-env-vars=WAHA_SWAGGER_USERNAME=admin \
  --set-env-vars=WAHA_SWAGGER_PASSWORD=admin \
  --set-env-vars=WAHA_SWAGGER_NO_PASSWORD=True \
  --set-env-vars=WAHA_SESSIONS_POSTGRESQL_URL="postgresql://swite:swite@postgres:5432/development?sslmode=disable" \
  --set-env-vars=WAHA_HOOK_URL="http://host.docker.internal:3001/api/v1/webhooks/waha" \
  --set-env-vars=WAHA_MEDIA_STORAGE=S3 \
  --set-env-vars=WAHA_S3_REGION=us-east-1 \
  --set-env-vars=WAHA_S3_BUCKET=waha \
  --set-env-vars=WAHA_S3_ACCESS_KEY_ID=minio \
  --set-env-vars=WAHA_S3_SECRET_ACCESS_KEY=minio123 \
  --set-env-vars=WAHA_S3_ENDPOINT=http://minio:9000 \
  --set-env-vars=WAHA_S3_FORCE_PATH_STYLE=True \
  --set-env-vars=WAHA_S3_PROXY_FILES=False \
  --cpu=1 \
  --memory=512Mi \
  --timeout=300s

gcloud projects add-iam-policy-binding switec \
  --member="user:brunowego@gmail.com" \
  --role="roles/run.admin"

gcloud run services add-iam-policy-binding waha \
  --project=switec \
  --region=us-east1 \
  --member="allUsers" \
  --role="roles/run.invoker"

gcloud iam service-accounts list --project switec

gcloud iam service-accounts create waha-sa \
  --project switec \
  --display-name "WAHA Cloud Run Service Account"

gcloud iam service-accounts add-iam-policy-binding \
  waha-sa@switec.iam.gserviceaccount.com \
  --member="user:brunowego@gmail.com" \
  --role="roles/iam.serviceAccountUser"

gcloud run services replace waha.yml \
  --project=switec \
  --region=us-east1 \
  --platform=managed

gcloud run services add-iam-policy-binding waha \
  --project=switec \
  --region=us-east1 \
  --member="allUsers" \
  --role="roles/run.invoker"

gcloud services enable cloudbuild.googleapis.com --project=switec

gcloud services list --available | grep cloudbuild

cat <<'EOF' | gcloud builds submit --no-source --config=-
steps:
  - name: "gcr.io/cloud-builders/docker"
    args: ["pull", "docker.io/devlikeapro/waha-plus:gows-2025.11.4"]
    secretEnv: ["DOCKER_USER", "DOCKER_PASS"]
availableSecrets:
  secretManager:
    - versionName: projects/switec/secrets/dockerhub-auth/versions/latest
      env: "DOCKER_USER"
    - versionName: projects/switec/secrets/dockerhub-auth/versions/latest
      env: "DOCKER_PASS"
EOF

gcloud run services logs tail waha \
  --project=switec \
  --region=us-east1

gcloud run services logs read waha \
  --project=switec \
  --region=us-east1 \
  --limit=100

gcloud run services update waha \
  --project=switec \
  --region=us-east1 \
  --update-env-vars="RESTART_TIME=$(date +%s)"

gcloud run services delete waha \
  --project=switec \
  --region=us-east1
```

<!--
gcloud run services update waha --project=switec --region=us-east1 --update-env-vars="RESTART_TIME=$(date +%s)"

gcloud artifacts repositories list --project=switec --location=us-east1

gcloud secrets list --project=switec --filter="name:docker OR name:waha"
-->
