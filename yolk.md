# yolk

## CLI

### Installation

#### pip

```sh
pip3 install -U yolk3k
```

## TBD

```sh
export PACKAGE_JSON_URL="https://pypi.org/pypi/${1}/json"
export PACKAGE_JSON_URL="http://[hostname]/simple/django/json"

curl -L -s "$PACKAGE_JSON_URL" | jq  -r '.releases | keys | .[]' | sort -V

curl -Ls https://pypi.org/pypi/$pythonPackage/json | jq -r '.releases | keys_unsorted | sort_by( split(".") | map(tonumber) )'
```
