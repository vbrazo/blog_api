#!/bin/bash

set -ex

mix deps.get
mix ecto.create
mix ecto.migrate

exec "$@"
