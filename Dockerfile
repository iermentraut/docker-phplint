ARG COMPOSER_IMAGE_VERSION=2.1.3
ARG PHPLINT_PACKAGE_VERSION=3.0.3
ARG PHP_VERSION=8.0
ARG PLATTFORM=alpine

FROM composer:${COMPOSER_IMAGE_VERSION} AS build

# An ARG declared before a FROM is outside of a build stage, so it can’t be used
# in any instruction after a FROM.
# @see https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG PHPLINT_PACKAGE_VERSION
ARG PHP_VERSION
ARG PLATTFORM

RUN \
    set -xe && \
    composer --quiet global require overtrue/phplint:${PHPLINT_PACKAGE_VERSION}

FROM php:${PHP_VERSION}-cli-${PLATTFORM}

RUN \
  set -xe && \
  apk update && \
  apk add --no-cache \
    bash=5.1.4-r0

WORKDIR /src

COPY --from=build /tmp/vendor /root/.composer/vendor

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
