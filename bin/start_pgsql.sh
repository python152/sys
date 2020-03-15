#!/bin/bash

if [ -d /opt/pgsql ]; then
    export PGHOME=/opt/pgsql
fi


su - postgres -c "$PGHOME/bin/pg_ctl -D $PGHOME/data start"

export PATH=$PGHOME/bin:$PATH
