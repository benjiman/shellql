#!/usr/bin/env bats

. util/assertions.bats
. util/install.bats

@test "select a literal" {
  result="$(echo 'n/a' | sql select \'foo\')"
  assert_equals "foo" "$result"
}

@test "SELECT alias is created" {
  result="$(echo 'n/a' | SELECT \'foo\')"
  assert_equals "foo" "$result"
}

@test "SELECT from two columns" {
  result="$( echo 'foo bar' | SELECT _0 \|\| _0, _1 \|\| _1 from cols_stdin )"
  assert_equals "foofoo	barbar" "$result"
}

@test "SELECT from three columns three lines" {
  result="$( echo -e "foo bar baz\nalpha beta gamma\noof rab zab" | SELECT _0 \|\| _0, _1 \|\| _1, _2 \|\| _2  from cols_stdin order by _0 )"
  assert_equals "alphaalpha\tbetabeta\tgammagamma\nfoofoo\tbarbar\tbazbaz\noofoof\trabrab\tzabzab" "$result"
}

@test "SELECT from three columns and use numerical type to sort" {
  result="$( echo -e "1 bar baz\n3 beta gamma\n2 rab zab" | SELECT _2 from cols where _i0 \> 1 order by _i0 desc )"
  assert_equals "gamma\nzab" "$result"
}
