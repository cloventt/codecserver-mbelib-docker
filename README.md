# codecserver-mbelib-docker

This Dockerfile will build an image containing codecserver with the codecserver-mbelib-module pre-installed. Use this if you want to run OpenWebRx in Docker but also want to be able to decode DMR.

## Getting started
### Docker Compose
```
version: '3.3'
services:
    openwebrx:
        container_name: openwebrx
        restart: unless-stopped
        environment:
            - TZ=Your/Timezone
            - OPENWEBRX_ADMIN_USER=openwebrx
            - OPENWEBRX_ADMIN_PASSWORD=SecureMe
        devices:
            - /dev/bus/usb
        ports:
            - '8073:8073'
        volumes:
            - '/var/lib/openwebrx:/var/lib/openwebrx'
        image: 'jketterl/openwebrx:stable'

    codecserver-mbelib:
        build:
            context: https://github.com/cloventt/codecserver-mbelib-docker.git#main
            dockerfile: Dockerfile
        container_name: codecserver-mbelib
        restart: unless-stopped
        environment:
            - TZ=Your/Timezone
        ports:
            - '1073:1073'
        volumes:
            - '/var/lib/openwebrx/codecserver-config:/etc/codecserver'
        image: codecserver-mbelib:latest
        depends_on:
          - openwebrx
```
