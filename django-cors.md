# Django Cross-origin Resource Sharing (CORS)

##

```py
INSTALLED_APPS = [
    # ...
    'corsheaders',
    # ...
]

MIDDLEWARE = [
    # ...
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    # ...
]


# Cross-origin Resource Sharing (CORS)
# https://github.com/adamchainz/django-cors-headers#setup

CORS_ALLOW_ALL_ORIGINS = True

CORS_ALLOW_METHODS = (
    'PUT',
    'POST',
)

CORS_ALLOW_HEADERS = (
    'Content-Type',
    'X-Auth-Token',
)

CORS_EXPOSE_HEADERS = (
    'Location',
    'X-Auth-Token',
)
```
