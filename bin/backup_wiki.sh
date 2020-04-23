#!/bin/bash

USER="root"
PASSWORD="l1o2r3e4"
DATABASE="wikidb"
mysqldump -h localhost -u ${USER} --password=${PASSWORD} ${DATABASE} \
    | gzip -9 > /root/mediawiki/aicipwiki-$(date '+%Y%m%d').sql.gz


