# Alertmanager MailCatcher

<!--
apiVersion: monitoring.coreos.com/v1alpha1
kind: AlertmanagerConfig
metadata:
  name: mailcatcher
  labels:
    alertmanagerConfig: training
spec:
  route:
    receiver: 'mailcatcher'
  receivers:
  - name: 'mailcatcher'
    emailConfigs:
    - to: 'alert@localhost'
      from: 'prometheus-operator@localhost'
      smarthost: '192.168.49.1:1025'
      requireTLS: false
-->

TODO
