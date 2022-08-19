# FastAPI

<!--
https://app.pluralsight.com/library/courses/fastapi-fundamentals/table-of-contents

https://github.com/flathub/website/tree/main/backend
https://github.com/keencho/finance-server

https://github.com/edodo1337/fastapi_tasks_crud_app
https://github.com/gustavoeraldo/lmi-api
https://github.com/MalikDeveloper2077/techlab
https://github.com/hpaez/crypto-api
https://github.com/MihaTeam1/fastapi_setup
https://github.com/pointtonull/poke-bard
-->

## Links

- [Code Repository](https://github.com/tiangolo/fastapi)
- [Main Website](https://fastapi.tiangolo.com/)
- [Alternatives](/alternatives/frameworks.md#python)

## Library

### Tools

- [Sentry](https://sentry.io/for/fastapi/)

### Installation

```sh
# As user dependency
pip3 install -U fastapi

# As project dependency
cat << EOF >> ./requirements-dev.txt
pydocstyle==4.0.1
pylint==2.4.3
EOF

cat << EOF >> ./requirements.txt
fastapi==0.79.0
uvicorn==0.18.2
EOF
```

```sh
pip3 install \
  -r ./requirements-dev.txt \
  -r ./requirements.txt
```

### Bootstrap API

```sh
#
mkdir -p ./app
mkdir -p ./tests

#
cat << EOF > ./app/main.py
# -*- coding: utf-8 -*-
'''This module defines a simple REST API.'''
from fastapi import FastAPI


app = FastAPI()


@app.get('/', status_code=200)
async def health_check():
    '''
    Checks the health of a project.
    It returns 200 if the project is healthy.
    '''
    return {'status': 'OK'}


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app, host='0.0.0.0', port=8080, debug=True)
EOF

#
uvicorn app.main:app \
  --reload \
  --log-level info
```

<!-- ### Issues

####

```log
ImportError: attempted relative import with no known parent package
```

TODO -->
