#!/bin/sh

set -ex

rake db:migrate

exec "$@"
