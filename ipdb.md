# ipdb

## Library

### Installation

```sh
# As user dependency
pip3 install -U ipdb

# As project dependency
echo 'ipdb==0.13.4' >> ./requirements-dev.txt
```

### REPL

```py
>>> import ipdb; ipdb.set_trace()
```

### Tips

#### Using on Try/Except

```py
try:
    # code
except:
    import ipdb; ipdb.set_trace()
```
