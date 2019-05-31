# Tips

##

```json
{
  "action_name": "Example",
  "idsite": 1,
  "rec": 1,
  "r": 345007,
  "h": 22,
  "m": 58,
  "s": 47,
  "url": "http://example.com",
  "_id": "44ebfeb79a5bb5e6",
  "_idts": 1539806328,
  "_idvc": 1,
  "_idn": 0,
  "_refts": 0,
  "_viewts": 1539806328,
  "send_image": 1,
  "cookie": 1,
  "res": "412x732",
  "gt_ms": 266,
  "pv_id": "bQkkXv"
}
```

```sh
curl -G -i "http://127.0.0.1:8000/piwik.php?action_name=Example&idsite=1&rec=1&r=345007&h=$(date +%H)&m=$(date +%M)&s=$(date +%S)&url=http%3A%2F%2Fexample.com%2F&_id=44ebfeb79a5bb5e6&_idts=$(date +%s)&_idvc=1&_idn=0&_refts=0&_viewts=$(date +%s)&send_image=1&cookie=1&res=412x732&gt_ms=266&pv_id=bQkkXv"
```
