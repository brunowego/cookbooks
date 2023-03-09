# Backstage

**Keywords:** Developer Portal, Software Catalog

<!--
https://github.com/search?o=desc&q=path%3Apackages%2Fbackend+%22backstage-cli%22+filename%3Apackage.json&s=indexed&type=Code
-->

<!--
https://github.com/devxp-tech/backstage
https://github.com/backstage/software-templates
-->

## Links

- [Code Repository](https://github.com/backstage/backstage)
- [Main Website](https://backstage.io)
- [Plugin](./plugins/README.md)
- [Spotify / Learn](https://backstage.spotify.com/learn/)
- Docs
  - [Backstage Software Catalog](https://backstage.io/docs/features/software-catalog/software-catalog-overview)
  - [TechDocs Documentation](https://backstage.io/docs/features/techdocs/techdocs-overview)
  - [Backstage Software Templates](https://backstage.io/docs/features/software-templates/software-templates-index)

## Demos

- [Backstage](https://demo.backstage.io)
- [Open edX](https://github.com/openedx/openedx-backstage)

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

<!-- ### Usage

```sh
# U
yarn backstage-cli create
``` -->

<!-- backstage-cli clean
package clean -->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension Intility.vscode-backstage

#
jq '."recommendations" += ["Intility.vscode-backstage"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Shortcut:** `Shift (⇧) + N`

### Issues

#### TBD

```log
backend:dev: 2023-02-17T09:33:32.879Z backstage error Request failed with status 500 Missing index for techdocs. This could be because the index hasn't been created yet or there was a problem during index creation. type=errorHandler name=MissingIndexError cause=undefined stack=MissingIndexError: Missing index for techdocs. This could be because the index hasn't been created yet or there was a problem during index creation.
```

TODO

#### TBD

```log
5error: Failed to build the docs page: Failed to generate docs from /var/folders/p_/l3lkz0q96wl948j7twxnm1pw0000gn/T/backstage-AO2i9G into /private/var/folders/p_/l3lkz0q96wl948j7twxnm1pw0000gn/T/techdocs-tmp-sfmi0L; caused by Error: This operation requires Docker. Docker does not appear to be available. Docker.ping() failed with; caused by Error: connect ENOENT /var/run/docker.sock {"timestamp":"2023-02-17T08:56:41.434Z"}
```

```yaml
techdocs:
  builder: local
  generator:
    runIn: local
  publisher:
    type: local
```

#### TBD

```log
7ERROR    -  Config value 'markdown_extensions': Failed to load extension 'markdown_inline_mermaid'.8ModuleNotFoundError: No module named 'markdown_inline_mermaid'
```

TODO

#### TBD

```log
5error: Failed to build the docs page: Failed to generate docs from /var/folders/p_/l3lkz0q96wl948j7twxnm1pw0000gn/T/backstage-JlQkER into /private/var/folders/p_/l3lkz0q96wl948j7twxnm1pw0000gn/T/techdocs-tmp-KiOw71; caused by Error: spawn mkdocs ENOENT {"timestamp":"2023-02-17T09:01:04.991Z"}
```

Missing mkdocs in your PATH. Please install it and try again.

<!--
pip3 install -U mkdocs-techdocs-core
-->

#### TBD

```log
7ERROR    -  Config value 'docs_dir': The path '/private/var/folders/p_/l3lkz0q96wl948j7twxnm1pw0000gn/T/backstage-WR7RRy/docs' isn't an existing directory.
```

TODO

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
  -n backstage \
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
