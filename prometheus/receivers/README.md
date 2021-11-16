# Alertmanager Receivers

## Links

- [Slack Compatible Webhook](https://discord.com/developers/docs/resources/webhook#execute-slackcompatible-webhook)
- [Github Compatible Webhook](https://discord.com/developers/docs/resources/webhook#execute-githubcompatible-webhook)

## Known Issues

- [Root AlertmanagerConfig name in Alertmanager spec, skips namespace matcher](https://github.com/prometheus-operator/prometheus-operator/pull/4034)

## Tips

### Alertmanager Config Selector

```sh
#
kubectl get alertmanager \
  -o jsonpath='{.items[*].spec.alertmanagerConfigSelector}' \
  -n monitoring
```

### Alertmanager Config Namespace Selector

```sh
#
kubectl get alertmanager \
  -o jsonpath='{.items[*].spec.alertmanagerConfigNamespaceSelector}' \
  -n monitoring

#
kubectl get namespace my-app \
  -o json |
    jq -r '.metadata.labels'

#
kubectl label namespace my-app alertmanagerconfig=enabled
```
