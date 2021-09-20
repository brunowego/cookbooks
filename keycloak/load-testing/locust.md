# Locust

##

```sh
#
kubectl create ns locust

#
cat << EOF | kubectl apply \
  -n locust \
  -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-loadtest-locustfile
data:
  main.py: |
    from locust import TaskSet, task, HttpUser, between

    class MyTaskSet(TaskSet):
        @task(2)
        def index(self):
            self.client.get('/')

        @task(1)
        def stats(self):
            self.client.get('/stats/requests')


    class WebsiteUser(HttpUser):
        host = 'http://http-https-echo.default:8080'
        wait_time = between(1, 2)
        tasks = [MyTaskSet]
EOF
```
