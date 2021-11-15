#!/bin/bash -xe

if [ -f /src/.phplint.yml ]; then
  /root/.composer/vendor/bin/phplint -vvv -c /src/.phplint.yml -- /src
else
  /root/.composer/vendor/bin/phplint \
    -vvv \
    --no-configuration \
    --warning \
    --exclude=vendor \
    --exclude=node_modules \
    --extensions=php \
    --jobs=10 \
    -- /src
fi
