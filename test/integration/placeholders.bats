#!/usr/bin/env bats

load suite

@test 'placeholder project should work with board' {
  if [ -z "$(which hub)" ]; then skip 'Hub should be available'; fi

  run build/bin/zenhub board -- --filter='.pipelines | .[0] | .name'
  [ "${status}" -eq 0 ]
  [ "${output}" = 'New Issues' ]
}
