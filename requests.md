# requests

## Library

### Installation

```sh
# As user dependency
pip install -U requests

# As project dependency
echo 'requests==2.24.0' >> ./requirements.txt
```

### REPL

```sh
export GITHUB_USERNAME=
export GITHUB_PASSWORD=
```

```py
>>> import requests
>>> import os
>>>
>>> r = requests.get('https://api.github.com/user', auth=(os.environ['GITHUB_USERNAME'], os.environ['GITHUB_PASSWORD']))
>>>
>>> r.status_code
>>> r.headers['content-type']
>>> r.encoding
>>> r.text
>>> r.json()
>>>
>>> r.delete('https://api.github.com/user', auth=(os.environ['GITHUB_USERNAME'], os.environ['GITHUB_PASSWORD']))
>>>
>>> exit()
```
