[![Build Status][badge-travis-image]][badge-travis-url]

Kong Plugin Static Response
====================

This repository contains a very simple Kong plugin for Static Response.

## Build your Docker Image:

build your own custom docker image and use kong image as base docker image.

```vi Dockerfile```

```
FROM kong:latest
USER root
RUN apk update && apk add git unzip luarocks
RUN luarocks install kong-plugin-static-response
USER kong
```

```
docker build -t kong:with-static-response-plugin .
```

## Use my Docker repo (Kong Version 2.3.0):

```
docker push nbhadauria/kong-plugin-static-response:latest
```

## To load Set the follwing variable:
```
KONG_PLUGINS=bundled,static-response
```

## Add Plugin

![GitHub Logo](/images/add_plugin.png)

## Set Content

![GitHub Logo](/images/add_response.png)

[badge-travis-url]: https://travis-ci.org/Kong/kong-plugin/branches
[badge-travis-image]: https://travis-ci.com/Kong/kong-plugin.svg?branch=master
