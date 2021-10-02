# Pika

## Links

- [Code Repository](https://github.com/pika/pika)
- [Main Website](https://pika.readthedocs.io/en/stable/)

## Library

### Installation

```sh
pip3 install pika
```

### REPL

```py
>>> import pika
>>>
>>> URL = 'amqp://[username]:[password]@127.0.0.1:5672/%2F'
>>> parameters = pika.URLParameters(URL)
>>> connection = pika.BlockingConnection(parameters)
>>> connection.is_open
True
>>> connection.close()
```
