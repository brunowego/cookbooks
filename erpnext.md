# ERPNext

<!--
https://github.com/allegro/ralph
-->

## Alternatives

- [GLPi (acronym: French: Gestionnaire Libre de Parc Informatique, or "Free IT Equipment Manager" in English)](/glpi.md)

## Links

- [Main Website](https://erpnext.com/)
- [Asset Management Software](https://erpnext.com/open-source-asset-management-software)

## Terms

- Enterprise Resource Planning (ERP)

## Docker

### References

- [ERPNext Docker Debian](https://pipech.github.io/erpnext-docker-debian/)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h erpnext \
  -p 3306:3306 \
  -p 8000:8000 \
  -p 9000:9000 \
  --name erpnext \
  --network workbench \
  docker.io/pipech/erpnext-docker-debian:v12-py3-latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000'
```

| Application | Login | Password |
| --- | --- | --- |
| ERPNext | `Administrator` | `12345` |
| MySQL | `root` | `travis` |

### Remove

```sh
docker rm -f erpnext
```
