# ActionCable

## Nginx

```sh
sudo vim /etc/nginx/sites-available/[appname]

server {
	...

	location /cable {
		passenger_app_group_name [appname]_action_cable;
		passenger_force_max_concurrent_requests_per_process 0;
	}
}
```

```sh
sudo systemctl restart nginx
```
