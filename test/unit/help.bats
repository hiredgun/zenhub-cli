#!/usr/bin/env bats

@test '-h should output usage' {
  run build/bin/zenhub -h
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}

@test '--help should output usage' {
  run build/bin/zenhub --help
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}
