# Horizontal Pod Autoscaler (HPA)

<!--
apiVersion: autoscaling/v2beta2
kind: HorizontalPodAutoscaler
metadata:
  name: rabbitmq-autoscaler
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: rabbitmq
  minReplicas: 3
  maxReplicas: 10
  metrics:
  - type: Object
    object:
      metric:
        name: rabbitmq_queue_messages_ready
      describedObject:
        apiVersion: v1
        kind: Service
        name: rabbitmq-service
      target:
        type: Value
        value: 5
-->
