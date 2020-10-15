# Docstring

## Python

### References

- [pydocstyle - Error Codes](http://www.pydocstyle.org/en/stable/error_codes.html)
- [PEP 257 - Docstring Conventions](https://www.python.org/dev/peps/pep-0257/)

### Modulo

```log
Missing docstring in public module pydocstyle(D100)
```

```py
# -*- coding: utf-8 -*-
"""Description of this module."""
```

```py
# -*- coding: utf-8 -*-
"""
Multi-line description
of this module.
"""
```

### Class

```log
Missing docstring in public classpydocstyle(D101)
```

```py
class Klass(object):
    """Description of this class"""

    def __init__(self):
```

### Function

```log
Missing docstring in public function pydocstyle(D103)
```

```py
def func(a):
    """Description of this function"""
    return str(a)
```
