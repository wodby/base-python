# About this Repo

[![Build Status](https://travis-ci.com/wodby/base-python.svg?branch=master)](https://travis-ci.com/wodby/base-python)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/base-python.svg)](https://hub.docker.com/r/wodby/base-python)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/base-python.svg)](https://hub.docker.com/r/wodby/base-python)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/base-python.svg)](https://microbadger.com/images/wodby/base-python)

This repository is a fork of https://github.com/docker-library/python with a few changes:

* We build only Alpine variants
* Base image changed to `wodby/alpine`
* Added debug variants compiled with `--with-pydebug` and non-strip bins

## Docker Images

* All images are based on Alpine Linux 3.9
* Base image: [wodby/alpine](https://github.com/wodby/alpine)
* [Travis CI builds](https://travis-ci.com/wodby/base-python) 
* [Docker Hub](https://hub.docker.com/r/wodby/base-python)

[_(Dockerfile 3.7)_]: https://github.com/wodby/base-python/tree/master/3.7/alpine3.9/Dockerfile.wodby
[_(Dockerfile 3.6)_]: https://github.com/wodby/base-python/tree/master/3.6/alpine3.9/Dockerfile.wodby
[_(Dockerfile 3.5)_]: https://github.com/wodby/base-python/tree/master/3.5/alpine3.9/Dockerfile.wodby
[_(Dockerfile 3.4)_]: https://github.com/wodby/base-python/tree/master/3.4/alpine3.9/Dockerfile.wodby
[_(Dockerfile 2.7)_]: https://github.com/wodby/base-python/tree/master/2.7/alpine3.9/Dockerfile.wodby

Supported tags and respective `Dockerfile` links:

* `3.7.2`, `3.7`, `3`, `latest` [_(Dockerfile 3.7)_]
* `3.6.8`, `3.6` [_(Dockerfile 3.6)_]
* `3.5.6`, `3.5` [_(Dockerfile 3.5)_]
* `3.4.9`, `3.4` [_(Dockerfile 3.4)_]
* `2.7.16`, `2.7`, `2` [_(Dockerfile 2.7)_]

