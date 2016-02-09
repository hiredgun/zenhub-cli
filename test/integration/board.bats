#!/usr/bin/env bats

load suite

@test 'board should should exit 0 and output filtered pipeline name' {
  run build/bin/zenhub board rockymadden/zenhub-cli --filter='.pipelines | .[0] | .name'
  [ "${status}" -eq 0 ]
  [ "${output}" = 'New Issues' ]
}
