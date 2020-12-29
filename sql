#!/bin/bash
SCHEMA=$(cat schema.sql)
VIEWS=$(cat views.d/*.sql)

WORK_DIR="$(mktemp -d --suffix='.bsql')"; 
mkfifo $WORK_DIR/fifo
QUERY="$@"

if [[ "$0" =~ .*SELECT$ ]]; then
	QUERY="SELECT $@";
fi


echo -e "$SCHEMA\n$VIEWS\n.import \"$WORK_DIR/fifo\" stdin\n.headers off\n.separator '	'\n$QUERY" | sqlite3 &
PID=$!
cat - > $WORK_DIR/fifo 
wait $PID
rm -rf "$WORK_DIR"
