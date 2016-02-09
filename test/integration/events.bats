#!/usr/bin/env bats

load suite

@test 'events should should exit 0 and output filtered user id' {
  run build/bin/zenhub events rockymadden/zenhub-cli 1 --filter='.[0] | .user_id'
  [ "${status}" -eq 0 ]
  [ "${output}" -eq 538508 ]
}
