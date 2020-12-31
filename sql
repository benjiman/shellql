#!/bin/bash

QUERY="$@"

if [[ "$0" =~ .*SELECT$ ]]; then
	QUERY="SELECT $@";
fi

SCHEMA_FILE=$(cat schema.sql)
VIEWS_FILES=$(cat views.d/*.sql)

INIT_STATEMENTS=".import \"/dev/stdin\" stdin\n.headers off\n.separator '\t'\n"

cat - | sqlite3 -init <(cat <(echo -e "$SCHEMA_FILE" "$VIEWS_FILES") <(echo -e $INIT_STATEMENTS) <(echo -e "$QUERY\n"))

