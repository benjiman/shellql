#!/bin/bash
SCHEMA=$(cat schema.sql)
VIEWS=$(cat views.d/*.sql)

WORK_DIR="$(mktemp -d --suffix='.bsql')"; 
mkfifo $WORK_DIR/fifo
QUERY=$1

echo -e "$SCHEMA\n$VIEWS\n.import \"$WORK_DIR/fifo\" stdin\n.headers on\n.separator '	'\n$QUERY" | sqlite3 &
PID=$!
cat - > $WORK_DIR/fifo 
wait $PID
rm -rf "$WORK_DIR"
