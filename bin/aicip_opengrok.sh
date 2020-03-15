#!/bin/bash

cd /opt/sources/ceph; git pull
/opt/opengrok-0.11.1/bin/OpenGrok index /opt/sources
