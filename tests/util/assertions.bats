assert_equals() {
	expected="$(echo -e "$1")"
	actual="$2"
	diff <(echo "$expected") <(echo "$actual")
	[ "$actual" == "$expected" ]
}
