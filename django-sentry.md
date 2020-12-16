# Django Sentry

## Library

### Installation

#### PIP

```sh
# As user dependency
pip install -U sentry-sdk

# As project dependency
echo 'sentry-sdk==0.19.4' >> ./requirements.txt
```

```py
import sentry_sdk
from sentry_sdk.integrations.django import DjangoIntegration

ENV = 'local'


# Sentry
# https://docs.sentry.io/platforms/python/guides/django/

if sentry_dsn := os.getenv('SENTRY_DSN'):
    sentry_sdk.init(dsn=sentry_dsn, environment=ENV, integrations=[DjangoIntegration()],
                    send_default_pii=True)

    # environment='production'
```

### Logging

```py
LOGGING = {
    # ...
    'handlers': {
        'sentry': {
            'level': 'ERROR',
            'class': 'sentry_sdk.integrations.logging.EventHandler',
        },
        # ...
    },
    'loggers': {
        # ...
        'raven': {
            'level': 'DEBUG',
            'handlers': ['console'],
            'propagate': False,
        },
        'sentry.errors': {
            'level': 'DEBUG',
            'handlers': ['console'],
            'propagate': False,
        },
        'sentry': {
            'level': 'ERROR',
            'handlers': ['sentry'],
            'propagate': False,
        },
    },
    'root': {
        'handlers': ['console', 'sentry'],
        'level': 'WARNING',
    },
}
```

### Issues

#### Behind Proxy

```log
WARNING 2020-12-09 19:34:11,690 connectionpool 58803 123145585803264 Retrying (Retry(total=2, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<urllib3.connection.HTTPSConnection object at 0x108c568b0>: Failed to establish a new connection: [Errno 8] nodename nor servname provided, or not known')': /api/2/store/
```

Use with [ProxyChains-NG](/proxychains-ng.md)

#### SSL Certificate Verify

```log
WARNING 2020-12-09 19:32:46,926 connectionpool 58730 123145522913280 Retrying (Retry(total=2, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1124)'))': /api/2/store/
```

```py
def _get_pool_options(self, ca_certs):
    return {
        'num_pools': 2,
        'cert_reqs': 'CERT_NONE'
    }

if sentry_dsn := os.getenv('SENTRY_DSN'):
    sentry_sdk.transport.HttpTransport._get_pool_options = _get_pool_options
    # ...
```
