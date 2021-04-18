# leproxy with docker

## build

```shell
$ docker build . -t flandre/leproxy
# or
$ docker-compose build
```

## run

```shell
$ docker-compose up -d
```

## mapping.yml

The reserved variable `$GATEWAY_IP` will be replaced in `start.sh`

If you want to use `localhost:port` directly, use following compose file:

```yaml
version: '3'
services:
  leproxy:
    build: .
    image: flandre/leproxy
    container_name: leproxy
    network_mode: host
    ports:
      - 80:80
      - 443:443
    volumes:
      - ./mapping.yml:/root/mapping.yml
      - ./letsencrypt:/var/cache/letsencrypt
```
