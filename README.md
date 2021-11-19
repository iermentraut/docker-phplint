# PHPLint Docker

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com/iermentraut/docker-phplint)
![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/iermentraut/docker-phplint/ci/master)
![GitHub](https://img.shields.io/github/license/iermentraut/docker-phplint)

## Description

Tiny Alpine-based dockerized version of Composer package [overtrue/phplint](https://github.com/overtrue/phplint) 
to use with `pre-commit`, `Github Actions`, `GitLab CI` and many others.

## Supported tags

[![Docker](https://badgen.net/badge/icon/docker?icon=docker&label)](https://hub.docker.com/r/iermentraut/phplint)
[![Docker Pulls](https://img.shields.io/docker/pulls/iermentraut/phplint.svg)]()

`alpine` based images:

| Docker tag | PHP Version | Image size |
|------------|-------------| ------------- |
| [3.0.3-alpine](https://github.com/iermentraut/docker-phplint/blob/master/Dockerfile) | Latest stable 3.0.3 version | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/iermentraut/phplint/3.0.3-alpine?style=plastic) |
| [3.0.2-alpine](https://github.com/iermentraut/docker-phplint/blob/master/Dockerfile) | Latest stable 3.0.2 version | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/iermentraut/phplint/3.0.2-alpine?style=plastic) |

## Usage

To use this image, pull from Docker Hub, run the following command:

```bash
docker pull iermentraut/phplint:3.0.3-alpine
```

### pre-commit (recommended)

```yaml
---
default_language_version:
    python: python3

default_stages: [commit, push]

repos:
    [...]
    - repo: local
      hooks:
          - id: docker-phplint
            name: docker-phplint
            language: docker_image
            entry: iermentraut/phplint:3.0.3-alpine
            args:
                - "--"
                - "/src"
            types: [file]
            files: \.php

    # or if you don't have a .phplint.yml file:

    - repo: local
      hooks:
          - id: docker-phplint
            name: docker-phplint
            language: docker_image
            entry: iermentraut/phplint:3.0.3-alpine
            args:
                - --no-cache
                - --no-configuration
                - --warning
                - --exclude=vendor
                - --exclude=node_modules
            types: [file]
            files: \.php
    [...]
```

### Standalone

```bash
docker run --rm -v $(pwd):/src iermentraut/phplint:3.0.3-alpine \
    -vvv \
    --no-cache \
    --no-configuration \
    --warning \
    --exclude=vendor \
    --exclude=node_modules \
    --extensions=php \
    --jobs=10

# or

docker run --rm -v $(pwd):/src iermentraut/phplint:3.0.3-alpine \
    -vvv \
    -c /src/.phplint.yml
```

### Github Action

```
Coming soon...
```

### GitLab CI

```
Coming soon...
```
