# OpenProject Docker Stack

## Running

```sh
#
git clone 'https://github.com/opf/openproject-deploy' \
  --depth=1 \
  --branch=stable/12 \
  ./openproject && \
    cd "$_"

#
cd ./compose

#
OPENPROJECT_HTTPS=false docker-compose up -d
```

<!--
#
http://127.0.0.1:8080
-->
