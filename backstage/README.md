# Backstage

**Keywords:** Developer Portal, Software Catalog

<!--
https://github.com/backstage/backstage/tree/master/docs/auth
https://github.com/backstage/backstage/blob/master/docs/auth/index.md#adding-the-provider-to-the-sign-in-page
-->

## Links

- [Code Repository](https://github.com/backstage/backstage)
- [Main Website](https://backstage.io/)
- [Demo](https://demo.backstage.io/)
- [Learn](https://backstage.spotify.com/learn/)
- Docs
  - [Backstage Software Catalog](https://backstage.io/docs/features/software-catalog/software-catalog-overview)
  - [TechDocs Documentation](https://backstage.io/docs/features/techdocs/techdocs-overview)
  - [Backstage Software Templates](https://backstage.io/docs/features/software-templates/software-templates-index)

## Configuration

- [`app-config.yaml`](https://github.com/backstage/backstage/blob/master/app-config.yaml)

## Glossary

- Internal Developer Platform (IDP)

## CLI

### Commands

```sh
npx @backstage/create-app -h
```

### Bootstrap

```sh
#
npx @backstage/create-app \
  --path ./ \
  --skip-install
```

### Usage

```sh
#
yarn backstage-cli create
```

## Helm

### Dependencies

- [Cert Manager (cert-manager)](/cert-manager/README.md)
  - [Local](/cert-manager/cluster-issuer/letsencrypt/local.md)

### References

- [Chart Repository](https://github.com/backstage/charts/blob/main/charts/backstage)

### Repository

```sh
helm repo add backstage 'https://backstage.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns backstage
# kubectl create ns catalog

#
kubens backstage

#
helm search repo -l backstage/backstage

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade backstage backstage/backstage \
  --version 0.14.0 \
  -f <(cat << EOF
ingress:
  enabled: true
  className: nginx
  host: backstage.${DOMAIN}
  tls:
    enabled: true
    secretName: backstage.tls-secret

backstage:
  extraEnvVars:
    - name: APP_CONFIG_app_baseUrl
      value: https://backstage.${DOMAIN}
    - name: APP_CONFIG_backend_baseUrl
      value: https://backstage.${DOMAIN}
    # - name: POSTGRES_HOST
    #   value: backstage-postgresql

  # extraEnvVarsSecrets:
  #   - backstage-database-authentication
  #   - backstage-kubernetes-authentication
  #   - backstage-github-authentication

# postgresql:
#   enabled: true
#   auth:
#     username: backstage
#     password: backstage
EOF
)

#
kubectl get all
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/backstage-postgresql \
  5432:5432
-->

### Status

```sh
kubectl rollout status deployment/backstage
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=backstage' \
  -f
```

### Secret

```sh
kubectl get secret backstage-postgresql \
  -o jsonpath='{.data.password}' | \
    base64 -d; echo
```

### Issues

#### TBD

```log
The Google provider is not configured to support sign-in
```

TODO

#### Missing Env. Variables

```log
Failed to load entity kinds
```

```log
index.esm.js:1466          GET http://localhost:7007/api/catalog/entity-facets?facet=kind net::ERR_CONNECTION_REFUSED
index.esm.js:1466          GET http://localhost:7007/api/catalog/entity-facets?facet=metadata.tags net::ERR_CONNECTION_REFUSED
index.esm.js:1466          GET http://localhost:7007/api/catalog/entities?filter=kind=component net::ERR_CONNECTION_REFUSED
index.esm.js:1466          GET http://localhost:7007/api/catalog/entities?filter=kind=component net::ERR_CONNECTION_REFUSED
```

Missing `backstage.extraEnvVars`: `APP_CONFIG_backend_baseUrl`, `APP_CONFIG_backend_origin` and `APP_CONFIG_app_baseUrl`.

### Delete

```sh
helm uninstall backstage \
  -n backstage

kubectl delete ns backstage \
  --grace-period=0 \
  --force
```

<!--
# FROM docker.io/library/node:18.12-alpine AS build

# WORKDIR /usr/src/packages/backend

# COPY ./packages ../

# RUN \
#   yarn install --prod --frozen-lockfile && \
#     yarn build


FROM docker.io/library/node:18.12-alpine AS deps

WORKDIR /usr/src/packages/backend

ADD ./packages/backend/dist/skeleton.tar.gz ../../

# RUN \
#   yarn install --prod --frozen-lockfile && \
#     yarn build


# FROM gcr.io/distroless/nodejs18-debian11:debug

# WORKDIR /app

# ADD ./packages/backend/dist/skeleton.tar.gz ./

# RUN yarn install --frozen-lockfile --production --network-timeout 300000

# ADD ./packages/backend/dist/bundle.tar.gz ./

# COPY ./app-config.yaml ./

# ENV NODE_ENV production

# # EXPOSE 5000

# CMD ["node", "./packages/backend", "--config", "./app-config.yaml"]
-->
