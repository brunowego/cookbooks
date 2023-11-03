# Argo CD Notifications

<!--
Problem Exists Between Keyboard and Chair (PEBKAC)
-->

## Links

- [Docs](https://argocd-notifications.readthedocs.io)
  - [Notification Services / Webhook](https://argocd-notifications.readthedocs.io/en/stable/services/webhook)
- [Triggers and Templates Catalog](https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/catalog)

<!--
https://argocd-notifications.readthedocs.io/en/stable/services/overview/
https://argo-cd.readthedocs.io/en/stable/user-guide/subscriptions
https://wearenotch.com/email-notifications-and-github-webhooks-with-argo-cd/
-->

<!--
https://github.com/juan-coralogix/integrations-docs/blob/master/integrations/argocd/README.rst
-->

```sh
#
stern argo-cd-argocd-notifications-controller

#
kubens argocd

#
kubectl get cm argocd-notifications-cm -o yaml

#
kubectl edit cm argocd-notifications-cm

#
stern -s 1s argo-cd-argocd
```

```yml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-notifications-cm
data:
  service.webhook.acme: |
    url: https://webhook.site/7758eb40-ae44-410a-8b92-88ed6e0e0017
    headers:
      - name: Content-Type
        value: application/json
  subscriptions: |
    - recipients:
        - acme
      triggers:
        - on-deployed
  template.app-sync-succeeded: |
    webhook:
      acme:
        method: POST
        body: |
          {
            "name": "{{.app.status.sync.revision}}",
            "application": ["{{.app.spec.project}}"],
            "subsystem": ["{{.app.metadata.name}}"]
          }
  trigger.on-deployed: |
    - when: app.status?.operationState?.phase in ['Succeeded'] and app.status?.health?.status == 'Healthy'
      oncePer: app.status?.sync?.revision
      send: [app-sync-succeeded]
```

```sh
kubectl get application acme -o yaml
```

```yml
---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  annotations:
    notifications.argoproj.io/subscribe.on-deployed.acme: 'acme | deployed'
```

## Issues

### TBD

```log
argo-cd-argocd-notifications-controller-5f84cb487c-rb9lq notifications-controller time="2023-10-27T12:54:25Z" level=error msg="failed to execute when condition: cannot fetch phase from <nil> (1:27)\n | app.status.operationState.phase in ['Running']\n | ..........................^"
```

<!--
https://archive.sweetops.com/argocd/2023/05/
-->

TODO
