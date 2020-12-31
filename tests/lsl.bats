#!/usr/bin/env bats

. util/assertions.bats
. util/install.bats

setup() {
  super.setup
  DIR=$(mktemp -d --suffix='.lsl-test')   
}

teardown() {
  super.teardown
  rm -rf "$DIR"
}

@test "SELECT filename" {
  touch $DIR/foo
  touch $DIR/baz
  
  result="$(ls -l $DIR | SELECT filename FROM lsl order by filename desc)"
  assert_equals "foo\nbaz" "$result"
}

@test "SELECT executable files" {
  touch $DIR/foo
  touch $DIR/bar
  touch $DIR/baz
  chmod +x $DIR/bar
  
  result="$(ls -l $DIR | SELECT filename FROM lsl where executable order by filename desc)"
  assert_equals "bar" "$result"
}

@test "SELECT files above 100 bytes" {
  touch $DIR/foo
  yes | head -n 1000 > $DIR/bar
  yes | head -n 200 > $DIR/baz
  
  result="$(ls -l $DIR | SELECT filename,file_size FROM lsl where file_size \> 100 order by filename)"
  assert_equals "bar\t2000\nbaz\t400" "$result"
}

@test "SELECT files filtered by name" {
  touch $DIR/foo
  touch $DIR/bar
  touch $DIR/baz
  
  result="$(ls -l $DIR | SELECT filename FROM lsl where filename like \'\%oo\' order by filename)"
  assert_equals "foo" "$result"
}


