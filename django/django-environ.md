# Django Environ

## Library

### Installation

#### pip

```sh
# As user dependency
pip3 install -U django-environ

# As project dependency
echo 'django-environ==0.4.5' >> ./requirements.txt
```

**_settings.py_**

```py
from environ import Env, Path


env = Env(
    DEBUG=(bool, False)
)

BASE_DIR = Path(__file__) - 2

env.read_env('%s/.env' % str(BASE_DIR))
```
