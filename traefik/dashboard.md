# Traefik Dashboard

TODO

<!-- ```sh
#
cat << EOF | kubectl apply \
  -n traefik-system \
  -f -
apiVersion: v1
kind: Service
metadata:
  name: traefik-dashboard
  labels:
    app.kubernetes.io/instance: traefik
    app.kubernetes.io/name: traefik-dashboard
spec:
  type: ClusterIP
  ports:
  - name: traefik
    port: 9000
    targetPort: traefik
    protocol: TCP
  selector:
    app.kubernetes.io/instance: traefik
    app.kubernetes.io/name: traefik
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name:  traefik
  labels:
    app: traefik
    release: prometheus-stack
spec:
  jobLabel: traefik-metrics
  endpoints:
  - port: traefik
    path: /metrics
  namespaceSelector:
    matchNames:
    - traefik-system
  selector:
    matchLabels:
      app.kubernetes.io/instance: traefik
      app.kubernetes.io/name: traefik-dashboard
EOF

#
kubectl port-forward svc/traefik-dashboard \
  --address 0.0.0.0 \
  9000:9000 \
  -n traefik-system
``` -->
