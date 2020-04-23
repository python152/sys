#!/bin/bash

VENV=${HOME}/fwdev
if [ -d ${VENV} ]; then
    echo "Found existing ${VENV}"
    exit 1
fi

virtualenv --no-site-packages ${VENV}
${VENV}/bin/pip install \
    coverage \
    modernize \
    future \
    pylint \
    caniusepython3 \    
    tox 




