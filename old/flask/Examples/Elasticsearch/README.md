# Elasticsearch

## Usage

```sh
#
virtualenv ./.venv

#
source ./.venv/bin/activate

#
pip3 install -r requirements.txt
```

## Test

```sh
curl localhost:9200/recipes/_search?q=title:salad -X GET
```
