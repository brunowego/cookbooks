# Issues

## WARNING: No swap limit support

```sh
docker info
```

```sh
sudo sed -i '/^GRUB_CMDLINE_LINUX=/ s/""/"cgroup_enable=memory swapaccount=1"/' /etc/default/grub
```

```sh
sudo update-grub
sudo shutdown -r now
```

## Permission denied

```log
Post http:///var/run/docker.sock/images/create?fromImage=nginx&tag=: dial unix /var/run/docker.sock: permission denied
```

Add the docker group if it doesn't already exist:

```sh
sudo groupadd docker
```

Add the connected user "${USER}" to the docker group. You may have to logout and log back in again for this to take effect:

```sh
sudo gpasswd -a ${USER} docker
```

Restart the Docker daemon:

```sh
sudo systemctl restart docker
```

Reload user session:

```sh
su - $USER
```

## Create

```log
Post http:///var/run/docker.sock/v1.19/containers/create: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
```

```sh
$(boot2docker shellinit)
```

## JSON

```log
Get http:///var/run/docker.sock/v1.19/images/json: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
```

```sh
$(boot2docker up)
```

## Dial unix /var/run/docker.sock

```log
Get http:///var/run/docker.sock/v1.20/containers/json: dial unix /var/run/docker.sock: no such file or directory.
```

```sh
eval "$(docker-machine env default)"
```

## Group Not Exist

```log
usermod: group 'docker' does not exist
```

```sh
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl restart docker
newgrp docker
```

## Failed to get D-Bus connection

```log
Failed to get D-Bus connection: Operation not permitted
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h [hostname] \
  --cap-add SYS_ADMIN \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --name [name] \
  [image] [command]
```

| Name | Image | Command |
| --- | --- | --- |
| `centos` | `centos:7` | `/sbin/init` |
| `opensuse` | `opensuse:42` | |

```sh
docker exec -it [name] /bin/bash
```

## Remove network interface

```sh
docker network prune -f
```

```sh
ip link del docker0
```

##

```log
Error response from daemon: login attempt to http://[hostname]/v2/ failed with status: 503 Service Unavailable
```

```sh
nmap -p 80,443 [hostname]
nc -zv [hostname] 80
ncat --ssl [hostname] 443
openssl s_client -connect [hostname]:443

curl -k https://[hostname]/v2/_catalog
```
