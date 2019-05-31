# Proxy

##

```sh
nohup kubectl proxy --address=0.0.0.0 --port=8001 --accept-hosts=.* &> /dev/null &
```

```sh
kill -9 "$(lsof -nPi tcp:8001 | grep LISTEN | awk '{print $2}')"
```
