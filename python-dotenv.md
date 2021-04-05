# python-dotenv

## Library

### Dependencies

- [GSSAPI (Generic Security Services API)](/gssapi.md)

### Installation

```sh
# As user dependency
pip3 install -U python-dotenv

# As project dependency
echo 'python-dotenv==0.15.0' >> ./requirements.txt
```

### REPL

```sh
echo 'TEST=true' >> ./.env
```

```py
>>> from dotenv import load_dotenv
>>> import os
>>>
>>> load_dotenv()
>>>
>>> os.getenv('TEST')
>>> exit()
```
