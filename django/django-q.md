# Django Q

## Library

```py
# Q
# https://django-q.readthedocs.io/en/latest/configure.html#configuration

Q_CLUSTER = {
    'name': '[AppName]',
    'redis': {
        'host': config('REDIS_HOST'),
        'password': config('REDIS_PASSWORD'),
        'port': config('REDIS_PORT'),
        'db': config('REDIS_DB'),
    },
}
```

***tasks.py***

```py
from django.utils import timezone
from core.models import Response


def delete_past_responses(minutes=3):
    time_ago = timezone.now() - timezone.timedelta(minutes=minutes)
    past_responses = Response.objects.filter(displayed__lte=time_ago)
    past_responses.delete()
```

```sh
./manage.py shell
```

```py
from django_q.models import Schedule

Schedule.objects.create(name='Delete Past Responses', func='core.tasks.delete_past_responses', schedule_type=Schedule.MINUTES, minutes=3, kwargs='minutes=3')
```

```sh
./manage.py qcluster
```
