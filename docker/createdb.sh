#!/bin/bash

set -e

/usr/pgsql-9.4/bin/postgres -D /var/lib/pgsql/9.4/data &
PID=$!
echo "PostgreSQL Working (PID=$PID)"

sleep 3

/usr/pgsql-9.4/bin/createuser -D -E -R -S alice
echo "ALTER USER \"alice\" WITH ENCRYPTED PASSWORD 'karen';" | /usr/pgsql-9.4/bin/psql

/usr/pgsql-9.4/bin/createdb --owner=alice --template=template0 keihan
echo "ALTER DATABASE \"keihan\" SET timezone TO 'Asia/Tokyo';" | /usr/pgsql-9.4/bin/psql

PGPASSWORD=karen
for i in 10_lines.sql 11_stations.sql 12_stations_location.sql 13_lines_stations.sql 14_types.sql \
         15_dia_tables.sql 16_series.sql 17_trains_tables.sql 18_holidays.sql 20_dias.sql \
         20_dias_2015spring.sql \
         21-hensei.sql 22-hensei-name.sql 30_functions.sql 40_vacuum.sql
do
    echo "Importing $i"
    /usr/pgsql-9.4/bin/psql -f /var/www/sites/kh.fetus.jp/sqls/$i -U alice keihan
done

echo "Send TERM Signal to PgSQL"
kill $PID

echo "Waiting terminate..."
wait $PID
