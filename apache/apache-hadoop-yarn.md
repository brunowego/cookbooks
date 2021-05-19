# Apache Hadoop Yet Another Resource Negotiator (YARN)

## References

- [Cluster Metrics API](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/ResourceManagerRest.html#Cluster_Metrics_API)
- [Managing YARN ACLs](https://docs.cloudera.com/documentation/enterprise/5-12-x/topics/cm_mc_yarn_acl.html)

```sh
http://[hostname]:8088/ui2
curl -s http://[hostname]:8088/ws/v1/cluster/metrics | jq .

proxychains -q \
  curl -ik --negotiate -u : \
  -H "Accept: application/json" \
  -X GET \
  http:// [hostname]:8088/conf | \
    jq

proxychains -q curl --compressed -H "Accept: application/json" -X GET http:// [hostname]:8088/ws/v1/cluster/info

proxychains -q curl --negotiate -u: -X GET http:// [hostname]:8088/ws/v1/cluster/info

proxychains -q curl -ik -u : -X GET http:// [hostname]:8088/ws/v1/cluster/scheduler-conf | jq .

proxychains -q curl -ik -u : -X GET http:// [hostname]:8088/ws/v1/cluster/info | jq .

proxychains -q curl -ik -u : -X GET http:// [hostname]:8088/ws/v1/cluster/metrics | jq .

proxychains -q curl -ik -u : -X GET http:// [hostname]:8088/ws/v1/cluster/scheduler | jq .

proxychains -q curl -k --negotiate -u : -X GET http:// [hostname]:8088/ws/v1/cluster/scheduler

proxychains -q curl -k --negotiate -u : -X GET http:// [hostname]:8088/ws/v1/cluster/nodes/slave_node:8041

proxychains -q curl -k --negotiate -u : -X GET http:// [hostname]:8088/ws/v1/cluster/apps?state=RUNNING
```
