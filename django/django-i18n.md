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

## Commands

```sh
#
python -m django makemessages -h

#
python -m django compilemessages -h
```

## Configuration

```py
from pathlib import Path
import os
from django.utils.translation import gettext_lazy as _

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
```

**Static**

```py
LANGUAGE_CODE = 'pt-br'
```

**Or, Dynamic**

```py
MIDDLEWARE = [
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
]
```

Finally, define the supported languages and load locale path:

```py
LANGUAGES = (
    ('en-us', _('English (US)')),
    ('pt-br', _('Portuguese (BR)')),
)

USE_I18N = True

LOCALE_PATHS = (os.path.join(BASE_DIR, 'locale'),)
```

## Make/Compile Messages

```sh
mkdir -p ./locale

#
python -m django makemessages -l pt_BR
python -m django makemessages -a

#
python -m django compilemessages -l pt_BR
```

## Test

```sh
curl \
  -H 'Accept-Language: pt_BR' \
  http://127.0.0.1:8000
```