# Tabula

## App

### Installation

#### Homebrew

```sh
brew install tabula
```

## Library

### Installation

```sh
pip install tabula-py
```

### REPL

```py
>>> import tabula
>>>
>>> file = 'https://domain.com/file.pdf'
>>>
>>> tables = tabula.read_pdf(file, pages='all', multiple_tables=True, stream=True)
>>>
>>> tabula.convert_into(file, './tabula_tables.csv', output_format='csv', pages='all')
>>> exit()
```
