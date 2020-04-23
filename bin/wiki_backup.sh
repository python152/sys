#!/bin/bash

mysqldump --user=root --password=l1o2r3e4 wikidb > aicip.sql.latest
mysqldump --user=root --password=l1o2r3e4 wikidb --xml > aicip.xml.latest

