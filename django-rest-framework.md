# Django REST Framework

<!--
https://hakibenita.com/django-rest-framework-slow
https://django-rest-framework.programmingpedia.net/en/tutorial/2377/serializers
-->

## References

- [Versioning](https://www.django-rest-framework.org/api-guide/versioning/)

## Library

### Installation

#### PIP

```sh
# As user dependency
pip install -U djangorestframework

# As project dependency
echo 'djangorestframework==3.12.2' >> ./requirements.txt
```

Add `rest_framework` to your `INSTALLED_APPS` setting.

```py
INSTALLED_APPS = [
    # ...
    'rest_framework',
]
```

<!-- ```py
REST_FRAMEWORK = {
    'NON_FIELD_ERRORS_KEY': 'error',
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    )
}
``` -->

###

```sh
curl \
  -H 'Accept: application/json; indent=4' \
  -u admin:password \
  http://127.0.0.1:8000/users/
```

<!--
https://github.com/encode/django-rest-framework
https://github.com/vitthal-inani/SOAD_Project/blob/f295a49c5074f2fc3e3f31c8a74b9b66d768793b/Backend/PackUrBags/PackUrBags/settings.py
-->
