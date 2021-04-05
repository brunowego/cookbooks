# Setuptools

##

###

```py
# -*- encoding: utf-8 -*-
from pathlib import Path
from pkg_resources import parse_requirements


with Path(
    './requirements.txt'
).open() as requirements_txt:
    INSTALL_REQUIRES = [
        str(requirement)

        for requirement in parse_requirements(
            requirements_txt
        )
    ]


setup(
    # ...
    install_requires=INSTALL_REQUIRES,
    # ...
)
```

<!-- ```py
from os import path


def _read_reqs(relpath):
    fullpath = path.join(path.dirname(__file__), relpath)

    with open(fullpath) as f:
        return [s.strip() for s in f.readlines()
                if (s.strip() and not s.startswith('#'))]


INSTALL_REQUIRES = [line for line in _read_reqs('requirements.txt') if "://" not in line]
DEV_REQUIRES = [line for line in _read_reqs('requirements-dev.txt') if "://" not in line]
TEST_REQUIRES = [line for line in _read_reqs('requirements-test.txt') if "://" not in line]


setup(
    # ...
    install_requires=INSTALL_REQUIRES,
    extras_require={
        'dev': DEV_REQUIRES,
        'test': TEST_REQUIRES,
    },
    # ...
)
``` -->

###

```py
# -*- encoding: utf-8 -*-
from io import open
from re import search, M
from setuptools import setup


with open('./app/__init__.py', encoding='utf8') as version_f:
    version_match = search(
        r"^__version__ = ['\"]([^'\"]*)['\"]", version_f.read(), M
    )

    if version_match:
        version = version_match.group(1)
    else:
        raise RuntimeError('Unable to find version string.')


setup(
    # ...
    version=version,
    # ...
)
```

###

```py
# -*- encoding: utf-8 -*-
from io import open
from setuptools import setup


with open('./README.md', encoding='utf8') as readme:
    long_description = readme.read()


setup(
    # ...
    long_description=long_description,
    # ...
)
```

## Issues

### Invalid Version

```log
WARNING: Built wheel for [project-name] is invalid: Metadata 1.2 mandates PEP 440 version, but '0.0.1-SNAPSHOT' is not
```

Remove from version the suffix `-SNAPSHOT`. More [details here](https://www.python.org/dev/peps/pep-0440/).
