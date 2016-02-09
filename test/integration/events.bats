#!/usr/bin/env bats

load suite

@test 'events should should exit 0 and output filtered array' {
  run build/bin/zenhub events rockymadden/zenhub-cli 1
  [ "${status}" -eq 0 ]
  [ "${output}" = '[]' ]
}
