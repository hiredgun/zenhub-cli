#!/usr/bin/env bash

function setup() {
  if [ -z "${ZENHUB_CLI_GITHUB_TOKEN}" ] || [ -z "${ZENHUB_CLI_ZENHUB_TOKEN}" ]; then
    skip 'Environment variables should exist'
  fi

  build/bin/zenhub init \
    --github-token="${ZENHUB_CLI_GITHUB_TOKEN}" \
    --zenhub-token="${ZENHUB_CLI_ZENHUB_TOKEN}"

  # Poor man's throttle. ZenHub has rate limiting of 10 per minute.
  sleep 10
}
