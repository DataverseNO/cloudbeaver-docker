#!/bin/bash
gzip -cd  /tmp/dataverse.dump.gz > /mnt/tmp/postgres/dataverse.dump
docker exec --user postgres postgres dropdb -U dataverse dataverse
docker exec --user postgres postgres createdb -U dataverse dataverse
docker exec --user postgres postgres  psql -U dataverse dataverse -f /mnttmp/dataverse.dump
