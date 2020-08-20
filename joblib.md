# Joblib

## References

- [Docs](https://joblib.readthedocs.io/en/latest/)

## Library

### Installation

#### PIP

```sh
pip install -U joblib
```

### REPL

```py
>>> from joblib import Memory
>>> cachedir = '.cache'
>>> mem = Memory(cachedir)
>>> import numpy as np
>>> a = np.vander(np.arange(3)).astype(np.float)
>>> square = mem.cache(np.square)
>>> b = square(a)
________________________________________________________________________________
[Memory] Calling square...
square(array([[0., 0., 1.],
       [1., 1., 1.],
       [4., 2., 1.]]))
___________________________________________________________square - 0.0s, 0.0min
>>> c = square(a)
>>> # The above call did not trigger an evaluation
>>> exit()
```
