#!/bin/sh

function sql_to_bash {
    cat $1 | sed -e 's/`/\\`/g'  | sed -e 's/\$/\\$/g'
}

LOCATION=${1:-"$HOME/bin"}
echo "Installing to $LOCATION/sql"
TEMP=$(mktemp)
echo '#!/bin/bash' >> $TEMP

echo 'SCHEMA=$(cat << EOSCHEMA' >> $TEMP
sql_to_bash ./schema.sql >> $TEMP
echo 'EOSCHEMA' >> $TEMP
echo ');' >> $TEMP

echo 'VIEWS=$(cat << EOVIEWS' >> $TEMP
sql_to_bash "./views.d/*.sql" >> $TEMP
echo 'EOVIEWS' >> $TEMP
echo ');' >> $TEMP

cat ./sql | tail -n +4 >> $TEMP

cp $TEMP ${LOCATION}/sql
chmod u+x ${LOCATION}/sql

rm -f $TEMP
