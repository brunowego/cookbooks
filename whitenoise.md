# WhiteNoise

## Library

### Installation

#### pip

```sh
# As user dependency
pip3 install -U whitenoise

# As project dependency
echo 'whitenoise==5.2.0' >> ./requirements.txt
```

Add `django_extensions` to your `INSTALLED_APPS` setting.

```py
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    # ...
]
```
