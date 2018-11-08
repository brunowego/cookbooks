# Network

##

```env
DOCKER_NETWORK_SUBNET=10.1.1.0/24
```

```yml
networks:
  default:
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: ${DOCKER_NETWORK_SUBNET}
```
