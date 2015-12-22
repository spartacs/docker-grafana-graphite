#!/bin/bash

function cleanup()
{
    local pids=`jobs -p`
    if [[ "$pids" != "" ]]; then
        kill $pids >/dev/null 2>/dev/null
    fi
}

trap cleanup EXIT
set -e
mkdir -p /opt/graphite/storage/whisper
mkdir -p /opt/graphite/log/webapp
touch /opt/graphite/storage/graphite.db /opt/graphite/storage/index
chown -R www-data /opt/graphite/storage
chmod 0775 /opt/graphite/storage /opt/graphite/storage/whisper
chmod 0664 /opt/graphite/storage/graphite.db
cd /opt/graphite/webapp/graphite && python manage.py syncdb --noinput
/usr/bin/supervisord
