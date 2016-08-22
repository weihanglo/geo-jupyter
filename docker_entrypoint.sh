#!/bin/sh

set -e

if [ "$#" -eq 0 ]; then
    exec jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser
fi

exec "$@"
