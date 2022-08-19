# python-dotenv

## Links

- [Code Repository](https://github.com/theskumar/python-dotenv)

## CLI

### Installation

```sh
pip3 install -U 'python-dotenv[cli]'
```

### Commands

```sh
dotenv --help
```

### Usage

```sh
#
dotenv list

#
dotenv get [ENV]

#
dotenv set [ENV] [value]

#
dotenv run -- python ./[filename].py
```

## Library

### Dependencies

- [GSSAPI (Generic Security Services API)](/gssapi.md)

### Installation

```sh
# As user dependency
pip3 install -U python-dotenv

# As project dependency
echo 'python-dotenv==0.20.0' >> ./requirements.txt
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
