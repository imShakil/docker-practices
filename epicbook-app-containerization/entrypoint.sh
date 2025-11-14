#!/bin/sh

# Ensure directory exists
mkdir -p /epicbook/config

# Generate config.json from template
envsubst < /tmp/config-template.json > /epicbook/config/config.json

# Run CMD (node app)
exec "$@"
