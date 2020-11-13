# Django i18n

<!--
https://automationpanda.com/2018/04/21/django-admin-translations/
https://stackoverflow.com/questions/2938692/django-internationalization-for-admin-pages-translate-model-name-and-attribute
-->

## References

- [Translation](https://docs.djangoproject.com/en/3.1/topics/i18n/translation/)

## Tools

- [Poedit](/poedit.md)

<!--
https://matix.io/django-i18n-translation-cheatsheet/
http://reader.epubee.com/books/mobile/12/12281e5b8cf834db1ecf92812fd7ce5f/text00064.html
-->

## Configuration

### Static

```py
from django.utils.translation import gettext_lazy as _


LANGUAGE_CODE = 'pt-br'

LANGUAGES = (
    ('en', _('English')),
    ('pt-br', _('Português (BR)')),
)
```

### Dynamic

```py
from django.utils.translation import gettext_lazy as _


MIDDLEWARE = [
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
]


LANGUAGES = (
    ('en', _('English')),
    ('pt-br', _('Português (BR)')),
)
```

## Make/Compile Messages

```sh
mkdir -p ./locale

#
python -m django makemessages -h

#
python -m django makemessages -l pt_BR

# Darwin
open ./locale/pt-br/LC_MESSAGES/django.po

#
python -m django makemessages -a

#
python -m django compilemessages -h

#
python -m django compilemessages -l pt_BR

# 3.x
python -m django compilemessages -i './venv/*'
```

## Test

```sh
curl \
  -H 'Accept-Language: pt' \
  http://127.0.0.1:8000
```