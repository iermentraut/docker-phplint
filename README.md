# PHPLint Docker

![GitHub](https://img.shields.io/github/license/iermentraut/docker-phplint)
![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/iermentraut/docker-phplint/ci/master)
[![Docker Pulls](https://img.shields.io/docker/pulls/iermentraut/phplint.svg)]()
[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com/iermentraut/docker-phplint)

## Description

Docker image for [PHPLint](https://github.com/overtrue/phplint) to use
with `pre-commit`, `Github Actions`, `GitLab CI` and many others.

All supported tags also have:

- Alpine based image with `-alpine` suffix in tags

## Supported tags

`alpine` based images:

- `3.0.3-alpine` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/iermentraut/phplint/3.0.3-alpine?style=plastic)
- `3.0.2-alpine` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/iermentraut/phplint/3.0.2-alpine?style=plastic)

Check out [Docker Hub](https://hub.docker.com/r/iermentraut/phplint/tags)
for available tags.

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
            types: [file]
            files: \.php
    [...]
```

### Github Action

Coming soon...

### GitLab CI

Coming soon...

### Standalone

```bash
docker run --rm -v $(pwd):/src iermentraut/phplint:3.0.3-alpine
```
