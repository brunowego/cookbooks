# Issues

## Timezone

> PHP Warning: date_default_timezone_get(): It is not safe to rely on the system's timezone settings.

```sh
sudo sed -i 's|;date.timezone =|date.timezone = America/Sao_Paulo|g' [/path/to/php.ini]
```
