# Apache NiFi REST API

##

```sh
#
curl -s 'http://localhost:8080/nifi-api/resources' | jq

# Get version
curl -s 'http://127.0.0.1:8080/nifi-api/system-diagnostics' | \
  jq -r .systemDiagnostics.aggregateSnapshot.versionInfo.niFiVersion

#
curl -s 'http://127.0.0.1:8080/nifi-api/flow/templates' | \
  jq '.templates[] | select( .template.name=="Cockroach-Ingest") | .id'

#
export ROOT_PG=$(curl -s 'http://127.0.0.1:8080/nifi-api/flow/process-groups/root' | jq '.processGroupFlow.id' | sed "s/\"//g")

#
curl -s "http://127.0.0.1:8080/nifi-api/flow/process-groups/${ROOT_PG}/controller-services" | jq '.controllerServices[].component.id' | sed "s/\"//g"

#
export ROOT_ID=$(curl -s 'http://127.0.0.1:8080/nifi-api/process-groups/root' | jq -r .id)

#
export RESP=$(curl "http://127.0.0.1:8080/nifi-api/process-groups/${ROOT_ID}/templates/upload" -H 'X-Requested-With: XMLHttpRequest' -F "template=@OpenCV_Face_Detection.xml")
export TEMPLATE_ID=$(echo $RESP | xmllint --xpath '/templateEntity/template/id/text()' -)
export JSON="{\"templateId\":\"${TEMPLATE_ID}\",\"originX\":300,\"originY\":0}"
export curl "http://127.0.0.1:8080/nifi-api/process-groups/${ROOT_ID}/template-instance" -H "Content-Type: application/json" --data-binary $JSON

#
export curl "http://127.0.0.1:8080/nifi-api/flow/process-groups/${ROOT_ID}" -H "Content-Type: application/json" --data-binary "{\"id\":\"${ROOT_ID}\",\"state\":\"RUNNING\"}"
```
