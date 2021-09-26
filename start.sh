#!/bin/bash

pg_ctlcluster 13 main start
su -c 'createuser -s root ; createdb root ; psql --command="alter user root with encrypted password '\''abc123'\''"' -m postgres
cd app/
/bin/bash