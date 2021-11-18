ARG COMPOSER_IMAGE_VERSION=2.1.3
ARG PHPLINT_PACKAGE_VERSION=3.0.3
ARG PHP_VERSION=8.0

FROM composer:${COMPOSER_IMAGE_VERSION} AS build

ARG PHPLINT_PACKAGE_VERSION

RUN \
  set -xe && \
  composer --quiet --no-cache global require overtrue/phplint:${PHPLINT_PACKAGE_VERSION}

ARG PHP_VERSION

FROM php:${PHP_VERSION}-cli-alpine

LABEL Maintainer="Igor Ermentraut <ie@efsa.io>"

ENV PATH=/application/vendor/bin:$PATH

USER root

RUN \
  set -xe && \
  addgroup \
    -g 1001 \
    application && \
  adduser \
    -u 1001 \
    -G application \
    -g "" \
    -S \
    -s /bin/sh \
    -D \
    -h /application \
    application && \
  chmod 755 /application && \
  chown -R application:application /application && \
  apk update && \
  apk add --no-cache \
    bash=5.1.4-r0

COPY --chown=application:application --from=build /tmp/vendor /application/vendor

USER application

WORKDIR /src

ENTRYPOINT ["phplint"]

CMD ["--help"]
