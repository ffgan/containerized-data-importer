#!/bin/sh
CONFIG_FILE=${1:-/etc/docker/registry/registry-config.yml}
export OTEL_TRACES_EXPORTER=none
registry serve ${CONFIG_FILE}
