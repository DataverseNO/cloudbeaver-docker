#!/bin/bash
DBZA=/tmp/dataverse.dump.gz
if [ -f "$DBZA" ]; then
	    gzip -cd  $DBZA > /mnt/tmp/postgres/dataverse.dump
fi

chmod 755 /mnt/tmp/postgres/dataverse.dump
docker stop cloudbeaver
docker exec --user postgres postgres dropdb -U dataverse dataverse
docker exec --user postgres postgres createdb -U dataverse dataverse
docker exec --user postgres postgres  psql -U dataverse dataverse -f /mnttmp/dataverse.dump
docker start cloudbeaver


#0 3 * * * bash /distrib/cloudbeaver-docker/loaddatabase.sh 

