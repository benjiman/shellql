#!/usr/bin/env bats

. util/assertions.bats
. util/install.bats

SAMPLE_OUTPUT=$(cat <<EOF
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
benji    32541  0.1  0.1 4686124 155368 ?      Sl   10:44   0:21 /opt/google/chrome/chrome --type=renderer --field-trial-handle=2456953055710594672,8732137253087809140,132272 --lang=en-GB --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=1111 --no-v8-untrusted-code-mitigations --shared-files=v8_context_snapshot_data:100
benji    12646  1.2  0.0 4579004 52464 ?       Sl   13:56   0:00 /opt/google/chrome/chrome --type=renderer --field-trial-handle=2456953055710594672,8732137253087809140,132272 --lang=en-GB --num-raster-threads=4 --enable-main-frame-before-activation --renderer-client-id=2222 --no-v8-untrusted-code-mitigations --shared-files=v8_context_snapshot_data:100
root     31733  0.0  0.0      0     0 ?        I    13:57   0:00 [kworker/13:8]
benji    32748  0.0  0.0      0     0 ?        Z    13:57   0:00 [playpause.sh] <defunct>
benji    21749  0.8  2.0 649020 104108 ?       Sl   13:57   0:03 /usr/bin/konsole
benji    32752  0.0  0.0  10812  7524 pts/9    Ss   13:57   0:00 /bin/bash
EOF
);

fake_ps() {
    echo -e "$SAMPLE_OUTPUT"
}

@test "ps aux should discard the headings" {
  result="$(fake_ps | SELECT count\(\*\) from psaux)"
  assert_equals "6" "$result"
}

@test "ps aux finding highest CPU process" {
  result="$(fake_ps | SELECT executable from psaux ORDER BY cpu DESC LIMIT 1)"
  assert_equals "/opt/google/chrome/chrome" "$result"
}

@test "ps aux finding defunct" {
  result="$(fake_ps | SELECT executable FROM psaux WHERE command LIKE \'\%defunct\%\')"
  assert_equals "[playpause.sh]" "$result"
}

@test "ps aux finding highest mem" {
  result="$(fake_ps | SELECT pid FROM psaux ORDER BY mem DESC LIMIT 1)"
  assert_equals "21749" "$result"
}
