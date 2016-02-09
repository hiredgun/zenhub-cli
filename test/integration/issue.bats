#!/usr/bin/env bats

load suite

@test 'issue should should exit 0 and output filtered pipeline name' {
  run build/bin/zenhub issue rockymadden/zenhub-cli 1 --filter='.pipeline | .name'
  [ "${status}" -eq 0 ]
  [ "${output}" = 'New Issues' ]
}
