# Alertmanager Slack

## Custom Resource (CR)

### Install

```sh
#
kubectl get alertmanagerconfig -A

#
kubens '[ns-name]'

#
export SLACK_WEBHOOK='https://hooks.slack.com/services/[]/[]/[]'

#
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: slack-webhook
data:
  url: $(echo -n $SLACK_WEBHOOK | base64 -w 0)
EOF

#
cat << \EOF | kubectl apply -f -
apiVersion: monitoring.coreos.com/v1alpha1
kind: AlertmanagerConfig
metadata:
  name: slack-alerts
  labels:
    alertmanagerConfig: slack
spec:
  route:
    groupBy: ['job']
    groupWait: 30s
    groupInterval: 5m
    repeatInterval: 12h
    receiver: 'slack-alerts'
  receivers:
  - name: 'slack-alerts'
    slackConfigs:
    - sendResolved: true
      iconURL: https://avatars3.githubusercontent.com/u/3380462
      apiURL:
        name: slack-webhook
        key: url
      channel: '#alerts'
      title: |-
        [{{ .Status | toUpper }}{{ if eq .Status "firing" }}:{{ .Alerts.Firing | len }}{{ end }}] {{ .CommonLabels.alertname }} for {{ .CommonLabels.job }}
        {{- if gt (len .CommonLabels) (len .GroupLabels) -}}
          {{" "}}(
          {{- with .CommonLabels.Remove .GroupLabels.Names }}
            {{- range $index, $label := .SortedPairs -}}
              {{ if $index }}, {{ end }}
              {{- $label.Name }}="{{ $label.Value -}}"
            {{- end }}
          {{- end -}}
          )
        {{- end }}
      text: >-
        {{ range .Alerts -}}
        *Alert:* {{ .Annotations.title }}{{ if .Labels.severity }} - `{{ .Labels.severity }}`{{ end }}
        *Description:* {{ .Annotations.description }}
        *Details:*
          {{ range .Labels.SortedPairs }} • *{{ .Name }}:* `{{ .Value }}`
          {{ end }}
        {{ end }}
EOF
```

> Wait! This process take a while.
