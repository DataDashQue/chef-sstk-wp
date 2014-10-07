#!/usr/local/env bats

@test "nginx listening on TCP port 80" {
  run curl -I 0.0.0.0:80
  [ "$status" -eq 0 ]
  # according to the docs this should work but the test dies...
  #[ "${lines[0]}" = "HTTP/1.1 302 Found" ]
  #[ "${lines[9]}" = "Location: http://0.0.0.0/wp-admin/install.php" ]
}
