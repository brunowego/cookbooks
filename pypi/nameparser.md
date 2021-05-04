# nameparser

## Library

### Installation

```sh
# As user dependency
pip3 install -U nameparser

# As project dependency
echo 'nameparser==1.0.6' >> ./requirements.txt
```

### REPL

```py
>>> from nameparser import HumanName
>>>
>>> name = HumanName('Dr. Juan Q. Xavier de la Vega III (Doc Vega)')
>>> name.first
>>> name.last
>>>
>>> exit()
```
