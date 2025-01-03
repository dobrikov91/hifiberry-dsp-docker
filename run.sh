#!/bin/bash

CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"

if [ "$INSTALL_PROFILE_ON_FIRST_RUN" == "true" ]; then
    if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
        touch /$CONTAINER_FIRST_STARTUP

        sigmatcpserver $SERVER_OPTIONS &
        sleep 1
        dsptoolkit install-profile ./beocreate-universal-10.xml
        exit 0
    fi
fi

sigmatcpserver $SERVER_OPTIONS &
sleep 1
if [ "$ENABLE_SPDIF" == "true" ]; then
    dsptoolkit write-mem 4840 1
fi
sleep infinity
