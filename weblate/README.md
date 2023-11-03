# Weblate

<!--
CSRF_TRUSTED_ORIGINS
CSRF_COOKIE_DOMAIN=.xyz.tld
-->

**Keywords:** Translation System

## Links

- [Code Repository](https://github.com/WeblateOrg/weblate)
- [Main Website](https://weblate.org)
- [Docs](https://docs.weblate.org)
  - [Supported file formats](https://docs.weblate.org/en/latest/formats.html)
    - [GNU gettext](https://docs.weblate.org/en/latest/formats/gettext.html#gettext)
  - [Version control integration](https://docs.weblate.org/en/latest/vcs.html)
  - [Sample configuration](https://docs.weblate.org/en/latest/admin/sample.html)

## Examples

- [Codeberg](https://translate.codeberg.org)
- [MIT](https://weblate.appinventor.mit.edu)

## Helm

### References

- [Values](https://github.com/WeblateOrg/helm/tree/main/charts/weblate#values)

### Repository

```sh
helm repo add weblate 'https://helm.weblate.org'
helm repo update
```

### Install

```sh
#
kubectl create ns weblate
# kubectl create ns translate

#
kubens weblate

#
helm search repo -l weblate/weblate

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install weblate weblate/weblate \
  --version 0.4.24 \
  -f <(cat << EOF
---
adminEmail: admin@xyz.tld
adminUser: admin
adminPassword: $(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)

ingress:
  enabled: true
  ingressClassName: nginx
  hosts:
    - host: weblate.${K8S_DOMAIN}
      paths:
        - path: /
          pathType: Prefix
EOF
)
```

### Status

```sh
kubectl rollout status deploy/weblate
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=weblate' \
  -f
```

### Secret

```sh
kubectl get secret weblate \
  -o jsonpath='{.data.admin-password}' | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall weblate

kubectl delete ns weblate \
  --grace-period=0 \
  --force
```

## Tips

<!--
https://github.com/settings/keys
Authentication Keys
-->

### New Component

1. Add new translation component
   - Component name: MyApp
   - Source language: English (United States)
   - Version control system: GitHub pull request
   - Source code repository: `git@github.com:<owner>/<repo>.git`
   - Repository branch: `main`
   - Continue
2. Choose translation files to import: "File format `gettext PO file`, File mask `apps/myapp/src/locales/*/messages.po`"
3. Final Step: "Import"
   - Adding new translation: Disable adding new translations
   - Save
4. Community localization checklist (TODO)

## Issues

### TBD

```log
GitHub pull request API access for api.github.com is not configured
```

<!--
Could not push to remote branch on Operation/Control.
-->

TODO
