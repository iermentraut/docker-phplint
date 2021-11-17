#!/bin/bash -xe

# @TODO if $1 -> $@
if [ -f /src/.phplint.yml ]; then
  phplint -vvv -c /src/.phplint.yml -- /src
else
  phplint \
    -vvv \
    --no-cache \
    --no-configuration \
    --warning \
    --exclude=vendor \
    --exclude=node_modules \
    --extensions=php \
    --jobs=10 \
    -- /src
fi
