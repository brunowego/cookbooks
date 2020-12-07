# Camelot

## Library

### Dependencies

- [Ghostscript](https://github.com/brunowego/cookbooks/blob/develop/ghostscript.md)

### Installation

```sh
pip install camelot-py opencv-python
```

### REPL

```py
>>> import camelot
>>>
>>> file = 'https://www.seguranca.go.gov.br/wp-content/uploads/2020/11/relatorio-2020-jan-e-set.pdf'
>>>
>>> tables = camelot.read_pdf(file, pages='1-end', flavor='stream')
>>>
>>> tables[0].df
>>> tables[0].parsing_report
>>>
>>> tables.export('./camelot_tables.csv', f='csv')
>>> exit()
```

### Excalibur

#### Installation

```sh
pip install excalibur-py
```

#### Running

```sh
# Change to use '~/.excalibur' folder instead of '~/excalibur'
export EXCALIBUR_HOME="$HOME/.excalibur"

# Initialize locally database
excalibur initdb

# Run web server
excalibur webserver

# Open on web browser
echo -e '[INFO]\thttp://127.0.0.1:5000'
```
