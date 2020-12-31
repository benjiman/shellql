# shellql

Use sqlite in shell pipelines.

Requires sqlite3.

To install to ~/bin/ run 

```install.sh``` 


![ShellQL Example Gif. See tests/*.bats for text examples](https://benjiweber.co.uk/b/shellql.gif)


Query output by columns of strings/numbers

```bash
$> echo -e "foo bar 10 baz\nbaz xor 100 ting\n" | SELECT _0 FROM cols WHERE _i2 \> 18
baz
$> echo -e "foo bar 10 baz\nbaz xor 100 ting\n" | SELECT _0 FROM cols WHERE _i2 \> 8
baz
foo
$> echo -e "foo bar 10 baz\nbaz xor 100 ting\n" | SELECT sum\(_i2\) FROM cols
110
$> echo -e "foo bar 10 baz\nbaz xor 100 ting\n" | SELECT _0 \|\| _1 FROM cols
bazxor
foobar
```

SQL views allow querying output of known commands with meaningful names

```bash
$> touch foo
$> touch bar
$> touch baz
$> chmod +x bar
$> ls -l | SELECT filename FROM lsl WHERE executable ORDER BY filename DESC
bar
$> ls -l | SELECT filename FROM lsl WHERE filename LIKE \'b%\'
baz
bar
$> ls -l | SELECT filename FROM lsl WHERE directory
qux
$> yes | head -n 1000 > bar
$> yes | head -n 2000 > baz
$> ls -l | SELECT filename,file_size FROM lsl where file_size \> 100 order by filename
bar     2000
baz     4000
```

```
$> ps aux | SELECT executable from psaux ORDER BY cpu DESC LIMIT 1
/opt/google/chrome/chrome

```

