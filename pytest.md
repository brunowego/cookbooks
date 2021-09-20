# pytest

<!--
https://github.com/OCHA-DAP/gisrestlayer/blob/4975be559dad26bcd0c44b29e69962bab3908ab3/tests/conftest.py
https://github.com/Uzay-G/archivy/blob/723452e8af4abcb992dd613d3e3a41b64f38aad5/tests/integration/test_api.py
https://github.com/javierrivassyapse/versions-service/blob/17a56fec9e1138d590623804858d87fee2db88f8/tests/integration/api/v1/health/test_endpoints.py
https://github.com/zxftr45/rr_ml_workshop_19/blob/5678d0452a3b1b4448354b92076d8a42d1c72d5d/tests/conftest.py

https://github.com/quiqua/pytest-dotenv
-->

## CLI

### Installation

#### pip

```sh
# As user dependency
pip3 install -U pytest pytest-cov

# As project dependency
cat << EOF >> ./requirements-test.txt
pytest==6.2.4
pytest-cov==2.12.1
EOF
```

### Commands

```sh
pytest -h
```

### Usage

```sh
#
pytest \
  --cov ./ \
  --cov-report xml:./coverage.xml \
  --cov-report html \
  --junitxml ./result.xml \
  ./tests

#
cat << EOF >> ./.gitignore
/coverage.xml
/result.xml
EOF
```

### Tips

#### Django Configuration

```sh
cat << EOF > ./pytest.ini
[pytest]
python_files=test*.py
DJANGO_SETTINGS_MODULE=settings.test
DJANGO_SERVER=django
DJANGO_SERVER_PORT=8000
norecursedirs=env venv node_modules bower_components
EOF
```
